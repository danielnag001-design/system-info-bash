#!/bin/bash
#This is Daniel Script
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
output_file="$HOME/sysinfo_$timestamp.txt"
{
echo "===== Hostname ====="
hostname
echo " "
echo "===== OS ====="
cat /etc/os-release
echo " "
echo "===== uptime ====="
uptime -p
echo " "
echo "===== Kernel version ====="
uname -r
echo " "
echo "===== CPU info ====="
lscpu
echo " "
echo "===== Memory, human-readable ====="
free -h
echo " "
echo "===== IP and MAC for all interface ====="
ip a
echo " "
echo "===== Disk usage and filesystem types ====="
df -hT
echo " "
echo "===== Last 5 error line, any case ====="
grep -i error /var/log/syslog | tail -n 5
echo " "
} > "$output_file"
