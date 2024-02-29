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
