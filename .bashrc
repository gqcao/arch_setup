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
alias JabRef='wmname LG3D; java -jar $HOME/local/bin/JabRef-2.9.2.jar'
alias dbx='python3 $HOME/tools/dropbox.py'
alias vi='vim'
alias Mpuhti='sshfs gcao@puhti.csc.fi: $HOME/puhti/'
alias puhti='ssh -X puhti.csc.fi -l gcao'
alias UMpuhti='fusermount -u $HOME/puhti/'
alias rg='cd $HOME/tools/ranger/; uv run ranger.py $HOME'
# alias mvsde='fusermount -u /home/cao/muvis_merope/'
alias ll='ls -hl'
alias jpy='jupyter notebook'
alias vol='alsamixer'
alias nb='newsboat'
alias act='source ~/local/bin/activate_venv'
alias deact='source deactivate'
alias vpn='sudo openconnect vpn.cevt.se'
alias qchat='act llm; cd $HOME/Projects/genai-eval/; python -m src.agent.chat_agent -q'
alias gchat='act llm; cd $HOME/Projects/genai-eval/; python -m src.agent.chat_agent -g'
alias rpi='ssh claw'
alias clr='clear'
alias settime='timedatectl set-time'
alias p='sudo pacman'
alias rnd='< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-10};echo;'
alias weeknum='date +%V'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'

# Export path
export PATH=$PATH:$HOME/local/bin
export LD_LIBRARY_PATH=$HOME/local/lib
export PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig
export PYTHONPATH=
export C_INCLUDE_PATH=$HOME/local/include
export CPLUS_INCLUDE_PATH=$HOME/local/include
export CPPFLAGS="-I$HOME/local/include"
export LDFLAGS="-L$HOME/local/lib"

# AI
export USER_AGENT=jarvis
export QWEN_API_KEY=
export GOOGLE_API_KEY=
export LANGSEARCH_API_KEY=
export JINA_API_KEY=
export SEMANTIC_SCHOLAR_API_KEY=

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
