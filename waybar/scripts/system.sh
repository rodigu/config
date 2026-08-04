#!/bin/bash
cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.0f", usage}')
ram=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
temp=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null | awk '{printf "%.0f", $1/1000}')

if [ -z "$temp" ]; then
    echo "  $cpu%   $ram%"
else
    echo "  $cpu%   $ram%   ${temp}°C"
fi
