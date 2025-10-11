#!/bin/bash

main=$(xrandr | grep " connected" | cut -d " " -f 1 | grep -i edp)
extend=$(xrandr | grep " connected" | cut -d " " -f 1 | grep -i hdmi)

if [[ -n "$extend" ]]; then
  echo "[+] Found '$extend', let's do the work"
else
  echo "[-] No second monitor is found, Back to default"
  xrandr --auto
  xrandr --output $main --auto
  exit 1
fi

xrandr --auto
xrandr --output $extend --mode 1920x1080 --right-of $main
echo "[*] Done."