#!/bin/bash

# Usage message
usage() {
  echo "Usage: $0 [-b] /path/to/directory_or_sqlite_file"
  echo "  -b    Enable backup before vacuuming"
  exit 1
}

# Parse options
BACKUP=false
while getopts ":b" opt; do
  case $opt in
    b)
      BACKUP=true
      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND -1))

# Check argument
if [ -z "$1" ]; then
  usage
fi

TARGET="$1"

# Function to vacuum a single database
vacuum_db() {
  local DB_FILE="$1"
  echo "Processing: $DB_FILE"

  if [ "$BACKUP" = true ]; then
    BACKUP_FILE="${DB_FILE}.backup_$(date +%Y%m%d%H%M%S)"
    cp "$DB_FILE" "$BACKUP_FILE"
    echo "Backup created: $BACKUP_FILE"
  fi

  sqlite3 "$DB_FILE" "VACUUM;"
  if [ $? -eq 0 ]; then
    echo "Vacuum completed for: $DB_FILE"
  else
    echo "Error vacuuming: $DB_FILE"
  fi
  echo "--------------------------------"
}

# Determine if target is a file or directory
if [ -d "$TARGET" ]; then
  # Directory: find all .sqlite files
  find "$TARGET" -type f -name "*.sqlite" | while read -r DB_FILE; do
    vacuum_db "$DB_FILE"
  done
elif [ -f "$TARGET" ]; then
  # Single file: check if it ends with .sqlite
  if [[ "$TARGET" == *.sqlite ]] || [[ "$TARGET" == *.sqlite3 ]]; then
    vacuum_db "$TARGET"
  else
    echo "Error: File $TARGET is not a .sqlite file."
    exit 1
  fi
else
  echo "Error: $TARGET does not exist."
  exit 1
fi

echo "All database(s) processed."
