#! /bin/sh

chosen=$(printf "󰐥 Power Off\n󰜉 Restart\n󰌾 Lock\n󰀄 Logout" | rofi -dmenu -i -theme-str '@import "~/.config/rofi/powermenu.rasi"')

case "$chosen" in
   "󰐥 Power Off") poweroff ;;
   "󰜉 Restart") reboot ;;
   "󰌾 Lock") swaylock ;;
   "󰀄 Logout") swaymsg exit;;
   *) exit 1 ;;
esac
