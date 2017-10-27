# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/jason/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="kafeitu"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#POWERLEVEL9K_COLOR_SCHEME='light'
##POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ssh)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir vcs)
#POWERLEVEL9K_USER_BACKGROUND='060'
#POWERLEVEL9K_MODE='nerdfont-complete'


source $ZSH/oh-my-zsh.sh


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'
alias x='exit'
alias c='clear'
alias v='nvim'
alias cd.='cd && ls'
alias gti='git'
alias f="ranger"
alias sshfs-ch='echo -e "\n Start \n sshfs -o "IdentityFile=~/path/to/pem" user@192.168.1.1:/remote/directory ~/local/directory \n Stop \n fuseremount -u ~/local/directory \n"'
alias gray='feh --bg-scale ~/.bg/gray.png'
alias speed='curl -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
alias myscrot='scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png'

#Custom functions

sp () {
PATH=/usr/bin:/user/local/bin:/bin
source .profile 
source .zshrc
}

path () {
	sed 's/:/\n/g' <<< "$PATH"
}

#End Custom Funtions

export EDITOR="nvim"

export BROWSER="chromium-browser"

export TERM=xterm-256color


export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="/home/jason/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export NODE_PATH="$HOME/.nvm/versions/node/v6.2.2/bin"

export NODE_PATH="$HOME/.nvm/versions/node/v6.2.2/lib/node_modules:$NODE_PATH"

export PATH="$HOME/.nvm/versions/node/v6.2.2/bin:$PATH"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "/home/jason/.gvm/scripts/gvm" ]] && source "/home/jason/.gvm/scripts/gvm"

eval "$(direnv hook zsh)"
