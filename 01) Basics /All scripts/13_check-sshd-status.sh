#!/bin/bash

# This script checks if sshd is running

service="sshd"  # Assigning the service name

# Checking service status
if systemctl is-active --quiet $service; then
  echo "$service is running."
else
  echo "$service is NOT running."
fi
