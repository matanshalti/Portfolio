#!/bin/bash

# This script checks all partitions (mounted and unmounted) and shows their current state

MOUNTPOINT="/mnt/temp"
sudo mkdir -p "$MOUNTPOINT"

echo "📦 Checking all physical partitions (ext4, ntfs, etc)..."
echo "--------------------------------------------------------"

# Get all partitions (not disks), exclude loop and ram devices
lsblk -lnpo NAME,FSTYPE,TYPE | grep 'part' | grep -Ev 'loop|tmpfs|squashfs' | while read part fstype type; do
  # Skip empty entries
  [ -z "$part" ] && continue

  # Check if already mounted
  mountpoint=$(findmnt -n -o TARGET "$part" 2>/dev/null)

  if [ -n "$mountpoint" ]; then
    echo "🔍 $part ($fstype) is already mounted at $mountpoint:"
    df -hT "$mountpoint" | grep -vE '^Filesystem'
  else
    echo "🔧 Mounting $part ($fstype) temporarily..."
    sudo mount "$part" "$MOUNTPOINT" 2>/dev/null

    if mountpoint -q "$MOUNTPOINT"; then
      echo "✅ Mounted at $MOUNTPOINT"
      df -hT "$MOUNTPOINT" | grep -vE '^Filesystem'
      sudo umount "$MOUNTPOINT"
      echo "🔽 Unmounted $part"
    else
      echo "⚠️ Could not mount $part (maybe hibernated or unsupported fs)"
    fi
  fi

  echo "--------------------------------------------------------"
done
