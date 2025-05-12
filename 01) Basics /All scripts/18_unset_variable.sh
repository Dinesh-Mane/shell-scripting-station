#!/bin/bash

name="DevOps"
echo "Before unset: $name"

unset name
echo "After unset: $name"  # Will print nothing
