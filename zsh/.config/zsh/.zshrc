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

#aliases
alias vi=nvim
alias zconf='vi $HOME/.config/zsh/.zshrc'
alias gs='git status -sb'
alias gl='git log --oneline --decorate --graph'

#ls aliases
alias ls='exa -al --color=always --group-directories-first --icons'
alias la='exa -a --color=always --group-directories-first --icons'
alias ll='exa -l --color=always --group-directories-first --icons'
alias lt='exa -aT --color=always --group-directories-first'

#edit aliases
alias zsource="source $XDG_CONFIG_HOME/zsh/.zshrc"

export TERM="alacritty"
export EDITOR="nvim"
export BROWSER="firefox"
export PATH="$HOME/.local/share/lua-lsp:$PATH"
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/.starship/starship.toml
export STARSHIP_CACHE=$XDG_CACHE_HOME/.starship/cache

source ~/Desktop/repos/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/Desktop/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# End of lines added by compinstall
eval "$(starship init zsh)"
