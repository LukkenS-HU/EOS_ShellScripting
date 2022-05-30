#!/bin/bash

MAX_X=2560
MAX_Y=1440
MOVE_MOUSE=0

while [ 1 ]
do
  eval $(xdotool getmouselocation --shell)
  if [ $X -ge $MAX_X ]; then
    X=$MAX_X
    MOVE_MOUSE=1
  fi

  if [ $Y -ge $MAX_Y ]; then
    Y=$MAX_Y
    MOVE_MOUSE=1
  fi

  if [ $MOVE_MOUSE -eq 1 ]; then
    xdotool mousemove $((MAX_X / 2)) $((MAX_Y / 2))
    MOVE_MOUSE=0
  fi
done
