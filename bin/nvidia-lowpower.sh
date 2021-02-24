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

    # Type of chipset
    t=$(nvidia-smi -i $i --query-gpu=gpu_name --format=csv,noheader)
    if [ "$t" = "GeForce GTX 1070" ]; then
        puissance=100
    elif [ "$t" = "GeForce GTX 1070 Ti" ]; then
        puissance=100
    elif [ "$t" = "GeForce RTX 3070" ]; then
        puissance=115
    else
        puissance=100
    fi

    nvidia-smi -i $i -pl $puissance
    iret=$?
    if [ ! "x${iret}" = "x0" ]; then
        nvidia-smi -i $i -pl 120
    fi
done

# Check values
nvidia-smi -q -d power |grep "Enforced Power Limit"

exit 0
