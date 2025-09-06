# 🔐 Automated Backup & Recovery with Encryption + Cloud Storage

This project demonstrates a **secure, automated backup system** built using:
- **Bash scripting** for automation
- **GPG** for encryption
- **Cron** for scheduling
- **AWS S3** (or Google Drive via rclone) for offsite storage

It’s designed as a learning + portfolio project to showcase **system administration, security, and cloud integration skills**.

---

## 🚀 Features
- 📂 Compress files/folders into `.tar.gz`
- 🔑 Encrypt backups with **GPG** (asymmetric encryption)
- ☁️ Upload to **AWS S3** (or Google Drive alternative)
- ♻️ Automated with **cron jobs**
- ✅ Restore tested (backup → decrypt → extract)

---

## 📂 Project Structure
automating-backups/
├── backup.sh # Main backup script
├── sample_crontab.txt # Example cron schedule
├── README.md # Documentation
├── screenshots/


---

## ⚙️ Setup Guide

### 1. Clone repo
### 2. Make script executable
chmod +x backup.sh
### 3. Edit script
BACKUP_SRC="/var/www/html"   # Or your chosen directory
BACKUP_DEST="/home/ubuntu/backup-project/backups"
GPG_RECIPIENT="Your Name <youremail@example.com>"
### 4. Run backup manually
./backup.sh
### 5. Automate with cron
to install : 
    crontab sample_crontab.txt
### 6. To restore
# Decrypt
gpg -d backups/backup_2025-08-30_10-25-12.tar.gz.gpg > restore.tar.gz

# Extract
tar -xzf restore.tar.gz -C /path/to/restore/

