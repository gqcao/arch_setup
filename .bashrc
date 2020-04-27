#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi

# Environmental variables
BROWSER=firefox
TERMINAL=i3-sensible-terminal
FILE_MANAGER="cd /home/gcao/tools/ranger/; python ranger.py /home/gcao"

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
alias act='source activate'
alias deact='source deactivate'
alias clr='clear'
alias p='sudo pacman'
alias weeknum='date +%V'
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

export TERM=xterm
export TERMINFO=/etc/terminfo

export LC_ALL="en_US.UTF-8"
# anaconda
export PATH=/home/gcao/tools/anaconda3/bin/:$PATH
