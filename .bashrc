# .bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# if bash-completion available use it
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T" # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"


if [ -d /opt/python310/ ]; then
    export PATH=$PATH:/opt/python310/bin
fi
if [ -d $HOME/Develop/flutter/ ]; then
    export PATH=$PATH:$HOME/Develop/flutter/bin/
fi
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Alias's to modified commands
alias so='source'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias sudr="systemctl --user daemon-reload"
alias daemon-reload="systemctl --user daemon-reload"
alias rmd='/bin/rm  --recursive --force --verbose '
alias tree="eza --tree"
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only
alias labc='ls -lap'              # alphabetical sort
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh'               # sort by extension
alias lk='ls -lSrh'               # sort by size
alias lc='ls -ltcrh'              # sort by change time
alias lu='ls -lturh'              # sort by access time
alias lg='lazygit'
alias ls='exa --icons'
alias ll='exa -lah --icons'
alias ed='emacsclient -nw -a'
alias bashrc='nvim ~/.bashrc'
alias rm='rm -i'
alias t='tmux'
alias g='git'
alias c='clear'
alias nv='nvim'
alias vim='nvim'
alias chdotfiles='nvim $(fd --full-path $HOME/dotfiles/  --type file -H --exclude .git | fzf-tmux -p --reverse);'
alias code='cd $(fd --full-path $HOME/Code/  --type directory -H --exclude node_modules | fzf-tmux -p --reverse); nv'
alias chcode='cd $(fd --full-path $HOME/Code/  --type directory -H --exclude node_modules | fzf-tmux -p --reverse)'
alias vscode='/usr/bin/code'
alias hrun="history | fzf | cut -d ' ' -f 5- | xargs echo"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias secmon="xrandr --output HDMI-1-0 --mode 1920x1080 --refresh 144 --right-of eDP-1"
alias obi-sync="rclone sync $HOME/Obsidian/ obsidian:test --progress"
alias econf="nvim ~/dotfiles/.config/"
alias gc="git clone"
alias gc1="git clone --depth=1"

function gcl(){
    local repo=$1
    local j=$2
    if [ $(which git 2>/dev/null) ]; then
        notify-send "git cloning in to $(echo $1)"
        $(git clone https://github.com/$repo $j)
    fi
}

function git_ssh(){
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/enterprise
}

function mkcd(){
    local dir=$1
    if [ -d $dir ]; then
        cd $dir
    else
        mkdir -p $dir
        cd $dir
    fi
}

# ps1 export
export PS1='\u@\h \W \$ '

# fastfetch only if available
[[ ! -z $(which fastfetch 2>/dev/null) ]] && fastfetch 
#
# If arch linux then have reflector on
if [ ! -z $(which pacman  2>/dev/null) ]; then
    if [ ! -z $( which reflector 2> /dev/null) ]; then
        alias update-mirror='sudo reflector --age 5 --country IN --fastest 5 --save /etc/pacman.d/mirrorlist 2>/dev/null'
    fi
fi

# some function exports
export -f gcl
export -f mkcd
export PATH=$PATH:$HOME/dotfiles/.config/scripts
export EDITOR=nvim
export TERMINAL=kitty

# init starship prompt, zoxide, autin if avilable
if command -v zoxide &>/dev/null; then 
    eval "$(zoxide init bash)"
fi
if command -v autuin &>/dev/null; then
    export ATUIN_NOBIND="true"
    eval "$(atuin init auto)"
    atuin-bind '\C-a' atuin-search
fi

# programming and emacs
# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -d $HOME/.config/emacs/bin ]; then
    export PATH=$PATH:$HOME/.config/emacs/bin/
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# java path
export PATH=$JAVA_HOME/bin:$PATH

# adb stuff
if [ -d $HOME/.local/bin/adb_android/ ]; then
    export PATH=$PATH:$HOME/.local/bin/adb_android
fi

export CHROME_EXECUTABLE=/usr/bin/chromium
alias ssh='TERM=xterm-256color ssh'

complete -C /usr/bin/terraform terraform

if command -v starship &>/dev/null; then 
    eval "$(starship init bash)"
fi
export PATH="$HOME/.local/bin:$PATH"
