# Script to read a number and check if it’s even or odd
#!/bin/bash

read -p "Enter a number: " num

if (( num % 2 == 0 )); then
  echo "$num is even."
else
  echo "$num is odd."
fi
