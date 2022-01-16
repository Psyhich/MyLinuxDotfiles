#!/bin/bash

feh --bg-fill ~/Pictures/Wallpapers/current_wallpaper

# Applying colors for Rofi and polybar
~/.config/wallpapers/pywal.sh ~/Pictures/Wallpapers/current_wallpaper

# Applying colors for Alacritty
~/.config/wallpapers/color_export.sh ~/.alacritty.yml

# Applying colors for Dunst
DUNST_FOLDER=~/.config/dunst
"$DUNST_FOLDER/cook.sh" "$DUNST_FOLDER/uncooked_dunstrc" "$DUNST_FOLDER/dunstrc"
