#!/bin/bash

set -e

# See https://wiki.archlinux.org/index.php/AMDGPU#Overclocking

gpu="1100 850"
ram="2200 950"

lst=$(find /sys/devices/ -name pp_od_clk_voltage)
for f in ${lst} ; do
  echo ${f}
  echo "s 7 $gpu" > ${f}
  echo "m 2 $ram" > ${f}
  echo "c"        > ${f}
done

lst=$(find /sys/devices/ -name power1_cap)
for f in ${lst} ; do
  echo 90000000 > ${f}
done

lst=$(find /sys/kernel/debug/dri/ -name amdgpu_pm_info)
for f in ${lst} ; do
  tail -10 ${f}
done
