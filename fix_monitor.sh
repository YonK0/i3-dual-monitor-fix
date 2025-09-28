#!/bin/bash

mainscreen="eDP"
extendscreen="HDMI-A-0"

screens=$(xrandr | grep " connected" | cut -d " " -f 1)

if echo "$screens" | grep -q "$extendscreen"; then
  echo "[+] Found '$extendscreen', let's do the work"
else
  echo "[-] '$extendscreen' not found, Back to default"
  xrandr --output HDMI-A-0 --off
  xrandr --output eDP --auto
  exit 1
fi

xrandr --output HDMI-A-0 --off
sleep 1
xrandr --output eDP --off
sleep 1
xrandr --output eDP --mode 2560x1440 --pos 0x0 --scale 1x1 --primary
#xrandr --output HDMI-A-0 --mode 2560x1440 --pos 2560x0 --scale 1x1
xrandr --newmode "1920x1080_144.00" 414.50 1920 2072 2280 2640 1080 1081 1084 1148 -HSync +Vsync
xrandr --addmode HDMI-A-0 "1920x1080_144.00"
xrandr --output HDMI-A-0 --mode "1920x1080_144.00" --pos 2560x0 --scale 1.5x1.5
