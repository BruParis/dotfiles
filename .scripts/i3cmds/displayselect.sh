#!/bin/sh

dual_screens() {
    primary=$(echo "$screens" | dmenu -i -p "Select primary screens:")
    secondary=$(echo "$screens" | grep -v "$primary")
    xrandr --output "$primary" --auto --scale 1.0x1.0 --output "$secondary" --right-of "$primary" --auto --scale 1.0x1.0
}

one_screen() {
       xrandr --output "$choice" --auto --scale 1.0x1.0 $(echo "$screens" | grep -v "$choice" | awk '{print "--output", $1, "--off"}' | tr '\n' ' ')
}

# get all possible displays.
displays=$(xrandr -q | grep "\ connected")

# get all connected sccreens.
screens=$(echo "$displays" | awk '{print $1}')

# get user choice for display selection
choice=$(printf "%s\\ndual-screens\\nGUI selection" "$screens" | dmenu -i -p "Select display layout:") &&case "$choice" in
        "manual selection") arandr ; exit;;
        "dual-screens") dual_screens ;;
        *) one_screen ;;
esac
