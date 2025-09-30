#!/bin/bash
set -x  

//export GTK_IM_MODULE=ibus
//export QT_IM_MODULE=ibus
//export XMODIFIERS=@im=ibus

ibus-daemon -drx --xim

// pkill scim

./project1 &

# ibus-daemon -drx

# /usr/bin/google-chrome-stable

xed &
