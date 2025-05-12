# Script to create a backup of a file with timestamp

#!/bin/bash

read -p "Enter file to backup: " filename

if [ ! -e "$filename" ]; then
  echo "File does not exist."
  exit 1
fi

timestamp=$(date +%Y%m%d_%H%M%S)
cp "$filename" "${filename}_backup_$timestamp"

echo "Backup created: ${filename}_backup_$timestamp"
