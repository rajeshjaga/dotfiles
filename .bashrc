# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa'
alias ll='exa -lah'
alias t='tmux'
alias g='git'
alias c='clear'
alias nv='nvim'
alias chdotfiles='nvim $(fd --full-path ~/dotfiles/  --type file -H --exclude .git | fzf-tmux -p --reverse);'
alias code='cd $(fd --full-path ~/code/  --type directory -H --exclude node_modules | fzf-tmux -p --reverse); nv'
alias chcode='cd $(fd --full-path ~/code/  --type directory -H --exclude node_modules | fzf-tmux -p --reverse)'


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
    alias updatemirror='sudo reflector --sort score --save /etc/pacman.d/mirrorlist'
fi


export PATH=$PATH:$HOME/dotfiles/.config/scripts
export PATH=$PATH:$HOME/.config/emacs/bin
export EDITOR=nvim
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

if [ ! -d $NVM_DIR ]; then 
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh" | bash
else
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi


if [ ! -f  "$HOME/.cargo/env" ]; then 
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else 
    . "$HOME/.cargo/env"
fi

if [ ! -f  "$HOME/.ghcup/env" ]; then 
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
else
<<<<<<< Updated upstream
[ -f "/home/lucifer/.ghcup/env" ] && . "/home/lucifer/.ghcup/env" # ghcup-env
=======
    . "/home/lucifer/.ghcup/env" # ghcup-env
>>>>>>> Stashed changes
fi


