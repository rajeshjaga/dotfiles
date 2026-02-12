# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
alias rmd='/bin/rm  --recursive --force --verbose '
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
#alias gcl='git clone '
alias hrun="history | fzf | cut -d ' ' -f 5- | xargs echo"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias secmon="xrandr --output HDMI-1-0 --mode 1920x1080 --refresh 144 --right-of eDP-1"
alias obi-sync="rclone sync $HOME/obsidian/test/ obsidian:test --progress"
alias econf="nvim ~/dotfiles/.config/"
#alias rm="mv $1 .trash"


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

PS1='\u@\h \W \$ '

[[ ! -z $(which fastfetch 2>/dev/null) ]] && fastfetch -c examples/17

if [ ! -z $(which xbps-install 2>/dev/null) ]; then
    alias install='sudo xbps-install'
    alias search='sudo xbps-query -Rs'
fi
if [ ! -z $(which pacman  2>/dev/null) ]; then
    alias install='sudo pacman -S '
    alias search='sudo pacman -Ss'
    alias update-mirror='sudo reflector --age 5 --country IN --fastest 5 --save /etc/pacman.d/mirrorlist 2>/dev/null'
fi
if [ ! -z $(which apt  2>/dev/null) ]; then
    alias install='sudo apt install '
    alias update='sudo apt update'
    alias listupgrade='sudo apt list --upgradable'
fi

export -f gcl
export -f mkcd
export PATH=$PATH:$HOME/dotfiles/.config/scripts
export PATH=$PATH:$HOME/Clone/lua-language-server/bin
export EDITOR=nvim
export TERMINAL=kitty

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [ ! $(echo $XDG_SESSION_TYPE) == "wayland" ]; then
    xset r rate 250 35
fi

eval "$(starship init bash)"
eval "$(zoxide init bash)"
if [ ! $( which autuin 2>/dev/null ) ]; then
    export ATUIN_NOBIND="true"
    eval "$(atuin init bash)"
    atuin-bind '\C-a' atuin-search
fi
#notify-send "Check hyprland pywal config to import dynamic colors and fallback colors"



export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$JAVA_HOME/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
