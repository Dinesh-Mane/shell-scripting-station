#!/bin/bash

# Script to display disk usage and warn if it exceeds 80%
# Use Case: Real-world DevOps/Monitoring scenario

usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//')  # `df` = disk free & `awk`, `sed` to extract percentage

if [ "$usage" -gt 80 ]; then
  echo "Warning: Disk usage is above 80%! Currently: $usage%"
else
  echo "Disk usage is normal: $usage%"
fi
