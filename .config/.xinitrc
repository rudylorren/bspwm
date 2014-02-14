
#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi


## Ensure that GTK themes are applied uniformly in the Desktop Environment

export GTK2_RC_FILES="$HOME/.gtkrc-2.0" 

numlockx &
nitrogen --restore &
xsetroot -cursor_name left_ptr &

xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset fp rehash
unclutter &

sxhkd &
exec bspwm
#exec i3

#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

#DEFAULT_SESSION=xfce4-session
#case $1 in
#  xfce) exec dbus-launch xfce4-session ;;
#  *) exec dbus-launch  $DEFAULT_SESSION ;;
#esac
