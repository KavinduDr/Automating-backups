#!/bin/bash


# Source and destination (set these as environment variables or update as needed)
BACKUP_SRC="/path/to/source"
BACKUP_DEST="/path/to/backup/destination"
TIMESTAMP=$(date +%F_%H-%M-%S)

# Make sure destination exists
mkdir -p $BACKUP_DEST

# Create a compressed backup
tar -czf $BACKUP_DEST/backup_$TIMESTAMP.tar.gz $BACKUP_SRC


# Encrypting files with GnuPG (replace RECIPIENT_EMAIL with your GPG key/email)
GPG_RECIPIENT="RECIPIENT_EMAIL"
gpg -e -r "$GPG_RECIPIENT" $BACKUP_DEST/backup_$TIMESTAMP.tar.gz
rm $BACKUP_DEST/backup_$TIMESTAMP.tar.gz

echo "Backup completed: $BACKUP_DEST/backup_$TIMESTAMP.tar.gz"

ENCRYPTED_BACKUP=$BACKUP_DEST/backup_$TIMESTAMP.tar.gz.gpg

# Upload to S3 (replace S3_BUCKET with your bucket name)
S3_BUCKET="s3://your-s3-bucket-name/"
aws s3 cp $ENCRYPTED_BACKUP $S3_BUCKET