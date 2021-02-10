#!/bin/bash

# Set GPU power at 100w or 115w if 100w doesn't work

if [[ ! `whoami` = 'root' ]]; then
  echo "Need to be logged as root"
  exit 1
fi

# Persistent mode
nvidia-smi -pm 1

# Number of GPU
nb=$(nvidia-smi --query-gpu=gpu_name --format=csv,noheader | wc -l 2>/dev/null)
expr $nb - 1

set +e

for i in $(seq 0 $nb); do

    nvidia-smi -i $i -pl 100
    iret=$?
    if [ ! "x${iret}" = "x0" ]; then
        nvidia-smi -i $i -pl 115
    fi
done

# Check values
nvidia-smi -q -d power |grep "Enforced Power Limit"

exit 0
