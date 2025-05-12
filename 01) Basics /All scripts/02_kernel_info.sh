#!/bin/bash

# Script to Understand Kernel Interaction
# Demonstrates how the shell (via script) interacts with the kernel to get system info

echo "Kernel Name      : $(uname -s)"   # `uname -s` → Shows Kernel name (like Linux)
echo "Kernel Release   : $(uname -r)"   # uname -r → Shows Kernel release version
echo "Kernel Version   : $(uname -v)"
