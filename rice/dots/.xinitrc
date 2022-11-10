xrandr --output DP-4 --mode 2560x1440 --rate 165
xinput --set-prop 'pointer:''Kingston HyperX Pulsefire Haste' 'libinput Accel Profile Enabled' 0, 1
#feh --bg-scale /home/awy/wallpapers/space.jpg
xrdb ~/.Xresources
#picom -b
#conky | while read -r; do xsetroot -name "$REPLY"; done &
exec dwm
