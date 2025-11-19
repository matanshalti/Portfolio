Matan Shealtiel (matanshalti)
==============================
      
01101101 01100001 01110100 01100001 01101110 01110011 01101000 01100001 01101100 01110100 01101001
      
Linux enthusiast.  
Self-taught sysadmin on the rise.  
Tinkerer of systems.  
Breaker of systems — learner from the wreckage.  
Automating the boring stuff and poking the internals until they make sense.  
Former sales strategist turned sysadmin — bridging communication and configuration.

---

## 🧪 Projects & Focus

### 🛡️ Automated Home Lab Backup Infrastructure
A "set and forget" backup strategy built from scratch using native Linux tools to ensure data integrity across local and cloud environments.

* **[Bash Automation Logic](./scripts/backup/)** *Core Scripting:* A custom Bash script utilizing `rsync` for incremental, efficient backups with error logging and drive safety checks.

* **[Local Scheduling (Systemd)](./config/backup/local_systemd/)** *Infrastructure as Code:* Replaced standard Cron jobs with `systemd` service units and timers for better process management and journal logging.

* **[Cloud Sync Configuration](./config/backup/cloud_systemd/)** *Offsite Disaster Recovery:* Configuration for automated encryption and upload to Google Drive via `rclone`, triggered by systemd timers.

### 💻 Systems Programming

* **[C - CLI File Editor](./C_Projects/cli_file_editor)**
    * **Focus:** Low-level logic & memory management.
    * **Description:** A command-line file editor built in C. This project helped me understand file descriptors, buffers, and how Linux handles text input/output at a system level.

---

## 📫 Contact

- Email: matanshalti@gmail.com
- Instagram: https://instagram.com/matanshalti  (personal life & curiosity window)
