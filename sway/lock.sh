#!/bin/sh
swayidle \
  timeout 30 'swaymsg "output * power off"' \
  resume 'swaymsg "output * power on"' &
swaylock -i /home/renaud/.config/sway/wallpaper.jpg
pid="$!"
kill "$pid"
