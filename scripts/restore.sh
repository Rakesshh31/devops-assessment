#!/bin/bash

# Database Restore Script
# Restores the database from a backup tar.gz produced by `backup.sh`.

set -euo pipefail

# Usage: restore.sh <backup_file> [--dry-run]

DRY_RUN=false
if [ "${2:-}" = "--dry-run" ] || [ "${1:-}" = "--dry-run" ]; then
    # support both: restore.sh --dry-run OR restore.sh <file> --dry-run
    if [ "${1:-}" = "--dry-run" ]; then
        echo "Usage: restore.sh <backup_file> [--dry-run]"
        exit 1
    fi
    DRY_RUN=true
fi

BACKUP_FILE="${1:-}"

if [ -z "$BACKUP_FILE" ]; then
    echo "Usage: ./restore.sh <backup_file> [--dry-run]"
    echo "Example: ./restore.sh backups/backup_20231201_120000.tar.gz --dry-run"
    exit 1
fi

if [ ! -f "$BACKUP_FILE" ]; then
    echo "Error: Backup file not found: $BACKUP_FILE"
    exit 1
fi

echo "Starting database restore..."
echo "Backup file: $BACKUP_FILE"

if [ "$DRY_RUN" = true ]; then
    echo "Dry-run: would restore from $BACKUP_FILE"
else
    # If DATABASE_URL is set and backup contains a SQL dump, use psql
    if [ -n "${DATABASE_URL:-}" ]; then
        echo "Restoring to Postgres using DATABASE_URL (note: backup must be SQL dump)"
        gunzip -c "$BACKUP_FILE" | psql "$DATABASE_URL"
    else
        echo "No DATABASE_URL provided. Please set DATABASE_URL for Postgres restores."
        echo "If your backup is not a SQL dump, adapt this script to extract and restore appropriately."
        exit 2
    fi
fi

echo "Restore completed successfully!"
echo "Database has been restored from: $BACKUP_FILE"
