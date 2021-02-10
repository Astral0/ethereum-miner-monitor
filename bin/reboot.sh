#!/bin/sh

echo "1" > /proc/sys/kernel/sysrq
/bin/sleep 1

echo "s" > /proc/sysrq-trigger
/bin/sleep 1

echo "u" > /proc/sysrq-trigger
/bin/sleep 1

echo "b" > /proc/sysrq-trigger

