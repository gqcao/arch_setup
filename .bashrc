#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Environmental variables
export BROWSER=firefox
export TERMINAL=st
export EDITOR=vim

# Terminal
export TERM=st
export TERMINFO=/usr/share/terminfo

# Alias..
alias JabRef='java -jar /home/gcao/local/bin/JabRef-2.9.2.jar'
alias dbx='python3 /home/gcao/tools/dropbox.py'
alias vi='vim'
alias Mpuhti='sshfs gcao@puhti.csc.fi: /home/gcao/puhti/'
alias puhti='ssh -X puhti.csc.fi -l gcao'
alias UMpuhti='fusermount -u /home/gcao/puhti/'
alias rg='cd /home/gcao/tools/ranger/; python ranger.py /home/gcao'
# alias mvsde='fusermount -u /home/cao/muvis_merope/'
alias ll='ls -hl'
alias jpy='jupyter notebook'
alias vol='alsamixer'
alias nb='newsboat'
alias act='source activate'
alias deact='source deactivate'
alias vpn='sudo openconnect vpn.cevt.se'
alias clr='clear'
alias settime='timedatectl set-time'
alias p='sudo pacman'
alias rnd='< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-10};echo;'
alias weeknum='date +%V'
alias webcam='mpv --title="mpvfloat" --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg --geometry=25% av://v4l2:/dev/video2 --profile=low-latency --untimed'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'

# Export path
export PATH=$PATH:/home/gcao/local/bin
export LD_LIBRARY_PATH=/home/gcao/local/lib
export PKG_CONFIG_PATH=/home/gcao/local/lib/pkgconfig
export PYTHONPATH=
export C_INCLUDE_PATH=/home/gcao/local/include
export CPLUS_INCLUDE_PATH=/home/gcao/local/include
export CPPFLAGS="-I/home/gcao/local/include"
export LDFLAGS="-L/home/gcao/local/lib"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi

# anaconda
export PATH=/home/gcao/tools/miniconda3/bin/:$PATH
