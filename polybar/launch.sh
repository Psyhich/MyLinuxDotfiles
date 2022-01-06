#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch pywal to get colors from wallpaper
"$DIR/scripts/pywal.sh" ~/Pictures/Wallpapers/current_wallpaper
# Set colorscheme for alacritty
"$DIR/color_export.sh" ~/.alacritty.yml

# Launch the bar
polybar -q main -c "/home/psyhich/.config/polybar/config.ini" &
