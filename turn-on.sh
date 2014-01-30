#!/bin/bash

# Permission check
if [ $(id -u) != 0 ]
then
  echo "Root permission is required to run this script!"
  exit 1
fi

# Check if msr-tools has been installed
./check-msr.sh

# Get the number of cores on this machine
number_of_cores=`grep ^processor /proc/cpuinfo | sort -u | wc -l`
echo "This machine has $number_of_cores cores"

# Turn on Turbo Boost
echo "Turn turbo boost on ..."
for (( i=0 ; i<$number_of_cores ; i++ ))
do
  wrmsr -p"$i" 0x1a0 0x0000850089
done
