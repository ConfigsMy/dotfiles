#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run numlockx
run sxhkd -c /home/artur/.config/sxhkd/sxhkdrc


