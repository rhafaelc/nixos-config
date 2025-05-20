#!/usr/bin/env bash

# Attempt to kill waybar processes
pkill waybar

# If pkill exit code is non-zero, it means no process was killed, 
# so waybar wasn't running. In that case, start waybar.
if [ $? -ne 0 ]; then
    waybar &
fi
