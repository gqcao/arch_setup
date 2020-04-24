export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xmodmap -e 'pointer = 3 2 1'

bash /home/gcao/.config/display/home-setup.sh 
~/.fehbg &
picom &
fcitx &
exec i3
