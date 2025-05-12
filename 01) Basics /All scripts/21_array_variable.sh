#!/bin/bash

# Declare array
services=("nginx" "mysql" "sshd")

# Loop through array
for svc in "${services[@]}"; do
  echo "🔍 Checking service: $svc"
  systemctl is-active --quiet $svc && echo "$svc is running" || echo "$svc is not running"
done
