#!/bin/bash

current_brightness=$(< /sys/class/backlight/intel_backlight/brightness)
incr=200

if [ "$1" = "up" ]; then
value=$((current_brightness + incr))
fi

if [ "$1" = "down" ]; then
value=$((current_brightness - incr))
fi

echo $value | sudo tee /sys/class/backlight/intel_backlight/brightness
