# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export TERM=screen-256color

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    #debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#Color Codes for Prompt
#Black: 30
#Blue: 34
#Cyan: 36
#Green: 32
#Purple: 35
#Red: 31
#White: 37
#Yellow: 33

#Show ip address at prompt
THEIP=$(/sbin/ifconfig | ack -1 'inet addr:' | cut -d: -f2 | awk '{ print $1}')

if [ "$color_prompt" = yes ]; then
    PS1="\[\033[01;36m\]\u\[\033[01;32m\]@\[\033[01;35m\]$THEIP\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
else
    PS1="\u@$THEIP:\w\$ "
fi
unset color_prompt force_color_prompt


# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    #;;
#*)
    #;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more aliases
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'
alias x='exit'
alias c='clear'
alias v='nvim'
alias cd.='cd && ls'
alias v.='nvim .'
alias gti='git'
alias sp='source .profile && source .bashrc'
alias lr='find .'
alias f="ranger"
alias sshfs-ch='echo -e "\n Start \n sshfs -o "IdentityFile=~/path/to/pem" user@192.168.1.1:/remote/directory ~/local/directory \n Stop \n fuseremount -u ~/local/directory \n"'
alias gray='feh --bg-scale ~/.bg/gray.png'
alias speed='curl -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
alias myscrot='scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png'

# Add an "alert" alias for long running commands.  Use like so:
#sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
    #. ~/.bash_aliases
#fi

# Additional file containing security sensitive aliases

#if [ -f ~/.sensitive ]; then
    #. ~/.sensitive
#fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
  #if [ -f /usr/share/bash-completion/bash_completion ]; then
    #. /usr/share/bash-completion/bash_completion
  #elif [ -f /etc/bash_completion ]; then
    #. /etc/bash_completion
  #fi
#fi

#Disable standard behavior for ctrl-s and ctrl-q so I can map ctrl-s to save in vim
stty -ixon

export PATH="/sbin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="/home/jason/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export NODE_PATH="$HOME/.nvm/versions/node/v6.2.2/bin"

export NODE_PATH="$HOME/.nvm/versions/node/v6.2.2/lib/node_modules:$NODE_PATH"

export PATH="$HOME/.nvm/versions/node/v6.2.2/bin:$PATH"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR="vim"

export BROWSER=chromium-browser

[[ -s "/home/jason/.gvm/scripts/gvm" ]] && source "/home/jason/.gvm/scripts/gvm"

eval "$(direnv hook bash)"

