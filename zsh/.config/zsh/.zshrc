# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/krosis/.zshrc'

setopt auto_cd

autoload -Uz compinit
compinit

# ssh setup
if eval `ssh-agent -s`; then
    ssh-add "$HOME/.ssh/id_rsa"

    trap 'kill $SSH_AGENT_PID' EXIT
fi

alias vi=nvim
alias ls='exa --icons --long --header --git --all'
export EDITOR="nvim"
#export MANPAGER="nvim -c 'set ft=man' -"

# End of lines added by compinstall
eval "$(starship init zsh)"
