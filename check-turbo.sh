#!/bin/bash

# Permission check
if [ $(id -u) != 0 ]
then
  echo "Root permission is required to run this script!"
  exit 1
fi

# Check if msr-tools has been installed
./check-msr.sh

# Get the register value
check=`rdmsr -p0 0x1a0 -f 38:38`

# Print out the result
if [ "$check" == "1" ]
then
  echo "Turbo boost has been turned off."
else
  echo "Turbo boost has been turned on."
fi
