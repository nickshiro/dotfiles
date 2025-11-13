#!/bin/bash

APP=$(grep -h '^Name=' /usr/share/applications/*.desktop ~/.local/share/applications/*.desktop \
       | cut -d= -f2 \
       | dmenu -i -fn "JetBrains Mono-11")

if [ -n "$APP" ]; then
    CMD=$(grep -h -A 5 "^Name=$APP" /usr/share/applications/*.desktop ~/.local/share/applications/*.local/applications/*.desktop \
           | grep '^Exec=' \
           | head -n1 \
           | cut -d= -f2 \
           | sed 's/ %.*//')
    $CMD &
fi
