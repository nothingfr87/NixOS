#! /bin/sh

chosen=$(printf "󰐥  \n󰜉 \n󰌾  \n  " | rofi -dmenu -i -theme-str '@import "~/.config/rofi/powermenu.rasi"')

case "$chosen" in
   "󰐥  ") poweroff ;;
   "󰜉  ") reboot ;;
   "󰌾  ") swaylock ;;
   "  ") systemctl suspend;;
   *) exit 1 ;;
esac
