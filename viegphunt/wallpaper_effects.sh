#!/usr/bin/env bash

# Create cache folder for swww
destination_wallpaper_dir="$HOME/.cache/swww"
mkdir -p "$destination_wallpaper_dir"

# Get the current wallpaper path
current_wallpaper_path=$(swww query | awk -F'image: ' '/image:/ {print $2; exit}')

# Generate a thumbnail of the current wallpaper
if [[ -n "$current_wallpaper_path" && -f "$current_wallpaper_path" ]]; then
    rm -f "$destination_wallpaper_dir/normal.png"
    vipsthumbnail "$current_wallpaper_path" -o "$destination_wallpaper_dir/normal.png"
fi

# Set fade transition for next wallpaper
swww img "$current_wallpaper_path" --transition-type fade --transition-duration 1 --transition-fps 60
