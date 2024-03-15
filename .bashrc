# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias t='tmux'
alias g='git'
alias c='clear'
alias nv='nvim'
alias updatemirror='sudo reflector --sort score --save /etc/pacman.d/mirrorlist'
alias chdotfiles='cd $(fd --full-path ~/dotfiles/  --type file -H --exclude .git | fzf-tmux -p --reverse); nvim'
alias code='cd $(fd --full-path ~/code/  --type directory -H --exclude node_modules | fzf-tmux -p --reverse); nv'
alias chcode='cd $(fd --full-path ~/code/  --type directory -H --exclude node_modules | fzf-tmux -p --reverse)'


PS1='\u@\h \W \$ '

#[[ ! -z $(which neofetch 2>/dev/null) ]] && neofetch
[[ ! -z $(which fastfetch 2>/dev/null) ]] && fastfetch

#[[ ! -e "$HOME/.cargo/env" ]] && "$HOME/.cargo/env"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$HOME/dotfiles/.config/scripts
export EDITOR=nvim
