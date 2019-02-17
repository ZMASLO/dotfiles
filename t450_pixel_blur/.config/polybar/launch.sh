#!/bin/sh

# Kill already running instances...
killall -q polybar

# Wait till process terminated...
while pgrep -x polybar >/dev/null; do
    sleep 1;
done

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m IFACE=$(ls /sys/class/net | grep wlp) polybar --reload top &
done

echo "Polybar started..."


