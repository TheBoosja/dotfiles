#!/bin/sh
opt=`echo -e "Lock\nShutdown\nReboot\nCancel" | dmenu -i -c -l 10`

rtrn=$?

if test "$rtrn" = "0"; then
  case $opt in
    Shutdown)
      poweroff
      break
      ;;
    Reboot)
      reboot
      break
      ;;
    Lock)
      ~/.config/awesome/scripts/lock.sh
      break
      ;;
    *)
      break
      ;;
  esac
else
  echo "Cancelled"
fi
