#!/bin/bash

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run numlockx
run sxhkd -c $HOME/.config/sxhkd/sxhkdrc
run polybar
run picom
run nextcloud --background
 
