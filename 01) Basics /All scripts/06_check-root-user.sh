#!/bin/bash

# script to check if a user is root or not.
# Use Case: Many admin-level scripts should only run as root.

# Check if current user is root
if [ "$(whoami)" != "root" ]; then
  echo "You must run this script as root!"
  exit 1
fi

echo "You are root. Script running safely."
