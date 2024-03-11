# load Chinese input
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Make the right key primary in mouse
xmodmap -e 'pointer = 3 2 1'

# set up the external monitor
bash ~/.config/display/home-setup.sh

# set background
fehbg &

# network manager on systray
nm-applet &

# set visual effects
# picom &
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &

# start language input
fcitx &

# notification
dunst &

# config urxvt based on personal preference
#xrdb ~/.Xresources

# start dwm
# dwmblocks &
# exec dwm

# start i3
exec i3
