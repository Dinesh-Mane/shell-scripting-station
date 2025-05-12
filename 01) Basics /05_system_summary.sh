# Script to Show All Details Together
# Demonstrates how shell scripting connects everything

#!/bin/bash

echo "------ SYSTEM INFORMATION ------"
echo "User: $USER"
echo "Shell: $SHELL"
echo "Operating System: $(uname)"
echo "Kernel Version: $(uname -r)"
echo "Interpreter (running this): $0"
echo "CPU Info: $(lscpu | grep 'Model name' | head -1)"
