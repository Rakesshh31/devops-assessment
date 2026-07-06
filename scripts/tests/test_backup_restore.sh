#!/usr/bin/env bash

set -euo pipefail

# Simple tests for backup.sh and restore.sh using dry-run mode.

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ROOT_DIR=$(cd "$SCRIPT_DIR/.." && pwd)

TMP_BACKUP_DIR=$(mktemp -d)
echo "Using temp backup dir: $TMP_BACKUP_DIR"

pushd "$ROOT_DIR" >/dev/null

# Run backup in dry-run, targetting temp dir
./backup.sh --dry-run "$TMP_BACKUP_DIR"

BACKUP_FILE=$(ls -1 "$TMP_BACKUP_DIR"/backup_*.tar.gz | tail -n1 || true)
if [ -z "$BACKUP_FILE" ]; then
  echo "Test failed: no backup file created"
  exit 1
fi

echo "Backup file created: $BACKUP_FILE"

# Run restore in dry-run
./restore.sh "$BACKUP_FILE" --dry-run

echo "Restore dry-run succeeded"

popd >/dev/null

rm -rf "$TMP_BACKUP_DIR"

echo "All tests passed"
