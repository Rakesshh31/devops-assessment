#!/bin/bash

# Database Backup Script
# This script creates a backup of the database

set -e

# Configuration
BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

echo "Starting database backup..."
echo "Backup file: $BACKUP_FILE"

# Example: PostgreSQL backup
# pg_dump $DATABASE_URL | gzip > "$BACKUP_FILE"

# Example: MySQL backup
# mysqldump -u $DB_USER -p$DB_PASSWORD $DATABASE_NAME | gzip > "$BACKUP_FILE"

# Example: MongoDB backup
# mongodump --archive="$BACKUP_FILE" --gzip

# Add your backup commands above

echo "Backup completed successfully!"
echo "Backup file: $BACKUP_FILE"

# Optional: Keep only last 7 days of backups
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +7 -delete

echo "Old backups cleaned up"
