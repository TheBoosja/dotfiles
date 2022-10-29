#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

# run ~/.config/polybar/launch.sh
run ~/.screenlayout/monitor.sh
# run picom
