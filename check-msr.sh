#!/bin/bash

# Permission check
if [ $(id -u) != 0 ]
then
  echo "Root permission is required to run this script!"
  exit 1
fi

# Check if msr-tools has been installed, install it if no
modprobe msr
if hash rdmsr 2>/dev/null
then
  echo "msr-tools has already been installed, continue ..."
else
  echo "install msr-tools in order to continue ..."
  apt-get install -y msr-tools
  modprobe msr
fi
