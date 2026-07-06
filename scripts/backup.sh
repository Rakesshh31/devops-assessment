#!/bin/bash

# Database Backup Script
# Creates a backup tar.gz for the target database.

set -euo pipefail

# Usage: backup.sh [--dry-run] [backup_dir]

# Configuration (can be overridden by env or args)
DRY_RUN=false
if [ "${1:-}" = "--dry-run" ]; then
	DRY_RUN=true
	shift || true
fi

BACKUP_DIR="${1:-${BACKUP_DIR:-./backups}}"
KEEP_DAYS="${KEEP_DAYS:-7}"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "Starting database backup..."
echo "Backup file: $BACKUP_FILE"

if [ "$DRY_RUN" = true ]; then
	echo "Dry-run mode: creating a placeholder backup file"
	TMPDIR=$(mktemp -d)
	echo "dry-run backup created at $TIMESTAMP" > "$TMPDIR/info.txt"
	tar -C "$TMPDIR" -czf "$BACKUP_FILE" info.txt >/dev/null
	rm -rf "$TMPDIR"
else
	# Prefer DATABASE_URL (Postgres) if provided
	if [ -n "${DATABASE_URL:-}" ]; then
		echo "Running pg_dump using DATABASE_URL"
		pg_dump "$DATABASE_URL" | gzip > "$BACKUP_FILE"
	elif [ -n "${DB_USER:-}" ] && [ -n "${DB_PASSWORD:-}" ] && [ -n "${DATABASE_NAME:-}" ]; then
		echo "Running mysqldump using DB_* variables"
		mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DATABASE_NAME" | gzip > "$BACKUP_FILE"
	else
		echo "No database configuration found. Set DATABASE_URL for Postgres or DB_USER/DB_PASSWORD/DATABASE_NAME for MySQL."
		echo "Exiting without creating a real backup. Use --dry-run to create a placeholder file."
		exit 2
	fi
fi

echo "Backup completed successfully!"
echo "Backup file: $BACKUP_FILE"

# Cleanup old backups
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +$KEEP_DAYS -delete || true

echo "Old backups cleaned up (older than $KEEP_DAYS days)"
