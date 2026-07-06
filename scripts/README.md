# Backup & Restore Scripts

This directory contains simple `backup.sh` and `restore.sh` utilities for the DevOps assessment.

Features
- Parameterized `BACKUP_DIR` and `KEEP_DAYS` via environment or args
- `--dry-run` mode for testing without a real database
- Basic support for Postgres (via `DATABASE_URL`) and MySQL (via `DB_USER`/`DB_PASSWORD`/`DATABASE_NAME`)

Usage

Create a dry-run backup (useful for tests):

```bash
./backup.sh --dry-run ./backups
```

Create a real Postgres backup (requires `DATABASE_URL`):

```bash
export DATABASE_URL="postgresql://user:pass@host:5432/dbname"
./backup.sh
```

Restore (dry-run):

```bash
./restore.sh ./backups/backup_20230101_120000.tar.gz --dry-run
```

Restore (Postgres):

```bash
export DATABASE_URL="postgresql://user:pass@host:5432/dbname"
./restore.sh ./backups/backup_20230101_120000.tar.gz
```

Tests

Run the included simple tests (they use `--dry-run`):

```bash
bash tests/test_backup_restore.sh
```

Notes
- The scripts favor safety: without configuration they will exit and instruct how to use `--dry-run`.
- Adapt the restore logic if your backups are stored as database-specific archives (e.g., mongodump archives).
