#!/bin/bash

# Script to check if a service is running (e.g., sshd)

service="sshd"

if systemctl is-active --quiet $service; then
  echo "$service is running."
else
  echo "$service is NOT running."
fi
