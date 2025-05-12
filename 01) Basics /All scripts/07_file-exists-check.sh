# Script to check if a file exists or not.
# Use Case: Before reading or deleting a file, ensure it exists.

#!/bin/bash

read -p "Enter filename to check: " file

if [ -e "$file" ]; then
  echo "File '$file' exists."
else
  echo "File '$file' does not exist."
fi


# `-e` checks if the file exists (regular, directory, symlink, anything).
