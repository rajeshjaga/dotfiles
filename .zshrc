# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# setting directory for zinit package manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# checking if zinit is present in the machine/user's home folder
if [ ! -d "$ZINIT_HOME" ]; then
        mkdir --parents "$( dirname $ZINIT_HOME)"
        git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# default alias for reloading things
alias reload='source ~/.zshrc'

# saucing things to make good shell
source "${ZINIT_HOME}/zinit.zsh"
source ~/.zsh_alias
export PATH=$PATH:$HOME/dotfiles/.config/scripts

# keybindings mode
#bindkey -v
[[ -f "$(which fastfetch)" ]] && fastfetch

#save history of executed commands
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

# prompt is powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

#zsh pulgins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# auto load completions
autoload -U compinit && compinit
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [ ! -f $NVIM_DIR ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -e /home/jraj/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jraj/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
