#!/bin/bash

xrandr \
  --output DP-2 --mode 1920x1080 --primary \
  --output DP-4 --mode 1920x1080 --left-of DP-2
