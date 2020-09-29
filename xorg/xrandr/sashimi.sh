#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------
# Running inside a VM in VirtualBox
#
#        ┎─────────────────┒
#        ┃     Virtual1    ┃
#        ┃    1920x1080    ┃
#        ┗────────┅────────┛
# --------------------------------------------------------------------------------------------------

# shellcheck disable=SC3333
xrandr --newmode $(cvt 1920 1080 60 | sed -n 's/Modeline //p')
xrandr --addmode Virtual1 '"1920x1080_60.00"'
xrandr --output Virtual1 --mode '"1920x1080_60.00"' --pos 0x0 --rotate normal
