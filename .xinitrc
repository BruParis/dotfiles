#!/bin/sh


[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -f ~/.xprofile ] && . ~/.xprofile

# exec i3
exec dwm

