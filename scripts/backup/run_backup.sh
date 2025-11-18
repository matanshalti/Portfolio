#!/bin/bash

# --- Configuration ---
MOUNT_POINT="/home/matanshalti/Network-Drives/Backups"
REMOTE_SHARE="//192.168.1.110/Backups"
CREDS_FILE="/home/matanshalti/.smb/credentials"
USER_ID=1000 # Your user ID from 'id -u'
GROUP_ID=1000 # Your group ID from 'id -g'

# Base directory for backups on the network drive
BASE_BACKUP_DIR="$MOUNT_POINT/Matan"
SYSTEM_BACKUP_DEST="$MOUNT_POINT/Fedora-System/" # Keep system backups separate

# --- Dynamic Variables ---
CURRENT_DATE=$(date +%Y-%m-%d)
TODAYS_DIR="$BASE_BACKUP_DIR/$CURRENT_DATE"
LATEST_LINK="$BASE_BACKUP_DIR/latest"

# --- Script Logic ---

echo "========================================="
echo "  Starting Versioned Backup Process"
echo "  Today's Backup: $CURRENT_DATE"
echo "========================================="

# 1. Mount the network drive
echo "--> Mounting network drive..."
if ! mountpoint -q "$MOUNT_POINT"; then
    echo "    Network drive not mounted. Mounting now..."
    sudo mount -t cifs -o credentials=$CREDS_FILE,uid=$USER_ID,gid=$GROUP_ID,vers=3.0 "$REMOTE_SHARE" "$MOUNT_POINT"
    if [ $? -ne 0 ]; then
        echo "    ERROR: Failed to mount the network drive. Aborting backup."
        exit 1
    fi
    echo "    Mount successful."
else
    echo "    Network drive is already mounted."
fi

# 2. Create today's backup directory
echo "--> Creating today's backup directory: $TODAYS_DIR"
mkdir -p "$TODAYS_DIR"
if [ $? -ne 0 ]; then
    echo "    ERROR: Failed to create today's directory. Aborting backup."
    # Attempt to unmount before exiting
    sudo umount "$MOUNT_POINT" &>/dev/null
    exit 1
fi

# 3. Run rsync with hard link optimization
echo "--> Starting rsync backup..."
rsync -aP --delete \
  --link-dest="$LATEST_LINK" \
  --exclude ".cache" \
  --exclude ".dbus" \
  --exclude "Downloads" \
  --exclude "Network-Drives" \
  "/home/matanshalti/" "$TODAYS_DIR/"

# Check if rsync was successful
RSYNC_EXIT_CODE=$?
if [ $RSYNC_EXIT_CODE -eq 0 ] || [ $RSYNC_EXIT_CODE -eq 23 ]; then # Exit code 0 is perfect, 23 means some files skipped (ok)
    echo "    rsync completed successfully (or with acceptable errors)."

    # 4. Update the 'latest' symlink to point to today's backup
    echo "--> Updating 'latest' symlink..."
    # Use relative path for link-dest compatibility
    ln -snf "$CURRENT_DATE" "$LATEST_LINK"
    if [ $? -ne 0 ]; then
        echo "    WARNING: Failed to update the 'latest' symlink."
    else
        echo "    'latest' symlink updated to point to $CURRENT_DATE."
    fi

    # 5. Clean up old backups (older than 30 days) - Optional
    echo "--> Cleaning up backups older than 30 days..."
    # Use find within the base backup dir, look for directories (-type d),
    # matching the date pattern YYYY-MM-DD, older than 30 days (-mtime +29),
    # and remove them (-exec rm -rf {} \;).
    # Important: Use -mindepth 1 to avoid matching the base dir itself.
    find "$BASE_BACKUP_DIR" -mindepth 1 -maxdepth 1 -type d -regextype posix-extended -regex '.*/[0-9]{4}-[0-9]{2}-[0-9]{2}' -mtime +29 -exec echo "    Deleting old backup: {}" \; -exec rm -rf {} \;
    echo "    Cleanup finished."

else
    echo "    ERROR: rsync failed with exit code $RSYNC_EXIT_CODE. Not updating 'latest' symlink or cleaning up."
    # Attempt to unmount before exiting
    sudo umount "$MOUNT_POINT" &>/dev/null
    exit 1
fi

# --- System Config Backups (Keep these simple mirrors for now) ---
echo ""
echo "--- Task 2: Backing up System Configurations (/etc) ---"
sudo mkdir -p "${SYSTEM_BACKUP_DEST}etc/"
sudo rsync -aP --delete "/etc/" "${SYSTEM_BACKUP_DEST}etc/"
echo "System configuration backup complete."

echo ""
echo "--- Task 3: Saving list of installed packages ---"
PACKAGE_LIST_FILE="${SYSTEM_BACKUP_DEST}installed-packages-$(date +%F).txt"
dnf list installed > "$PACKAGE_LIST_FILE"
echo "Package list saved to: $PACKAGE_LIST_FILE"

echo ""
echo "========================================="
echo "  All Backup Tasks Finished!"
echo "========================================="

exit 0
