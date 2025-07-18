# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

if [ ! -d $NVM_DIR ]; then 
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh" | bash
else
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi


#if [ ! -f  "$HOME/.cargo/env" ]; then 
#  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#else 
#    . "$HOME/.cargo/env"
#fi

alias ls='exa --icons'
alias ll='exa -lah --icons'
alias t='tmux'
alias g='git'
alias c='clear'
alias v='nvim'
alias nv='nvim'
alias vim='nvim'
alias chdotfiles='nvim $(fd --full-path $HOME/dotfiles/  --type file -H --exclude .git | fzf-tmux -p --reverse);'
alias code='cd $(fd --full-path $HOME/Code/  --type directory -H --exclude node_modules | fzf-tmux -p --reverse); nv'
alias chcode='cd $(fd --full-path $HOME/Code/  --type directory -H --exclude node_modules | fzf-tmux -p --reverse)'
alias vscode='/usr/bin/code'
#alias gcl='git clone '
alias hrun="history | fzf | cut -d ' ' -f 5- | xargs echo | xargs bash -c"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias secmon="xrandr --output HDMI-1-0 --mode 1920x1080 --refresh 119.98 --right-of eDP-1"
alias obi-sync="rclone sync /home/jraj/obsidian/test/ obsidian:test --progress"
alias econf="nvim ~/.config/"


function gcl(){
    local repo=$1
    local j=$2
    if [ $(which git 2>/dev/null) ]; then
        notify-send "git cloning in to $(echo $1)"
        $(git clone https://github.com/$repo $j)
    fi
}

PS1='\u@\h \W \$ '

[[ ! -z $(which neofetch 2>/dev/null) ]] && neofetch
[[ ! -z $(which fastfetch 2>/dev/null) ]] && fastfetch

if [ ! -z $(which xbps-install 2>/dev/null) ]; then
    alias install='sudo xbps-install'
    alias search='sudo xbps-query -Rs'
fi
if [ ! -z $(which pacman  2>/dev/null) ]; then
    alias install='sudo pacman -S '
    alias search='sudo pacman -Ss'
    alias update-mirror='sudo reflector --age 6 --country IN --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist 2>/dev/null'
fi
if [ ! -z $(which apt  2>/dev/null) ]; then
    alias install='sudo apt install '
    alias update='sudo apt update'
    alias listupgrade='sudo apt list --upgradable'
fi

export -f gcl
export PATH=$PATH:$HOME/dotfiles/.config/scripts
export PATH=$PATH:$HOME/Clone/lua-language-server/bin
export EDITOR=nvim
export TERMINAL=kitty

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(starship init bash)"
#notify-send "Check hyprland pywal config to import dynamic colors and fallback colors"
