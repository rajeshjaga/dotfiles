# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias install='sudo xbps-install'
alias search='sudo xbps-query -Rs'

PS1='\u@\h \W \$ '

[[ ! -z $(which neofetch 2>/dev/null) ]] && neofetch

. "$HOME/.cargo/env"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
