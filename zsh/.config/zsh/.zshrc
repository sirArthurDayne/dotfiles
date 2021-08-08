#FLEX MAN
neofetch
# promt colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#set autocomplete
setopt autocd
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/krosis/.zshrc'

#set tab completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall

# default aliases
# alias ls='ls --color=auto'
# alias la='ls -lA'
alias cl='clear'
# map 'exa' to 'ls'
alias ls='exa -al --color=always --group-directories-first --icons' # my preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
# git aliases
alias gs='git status'
alias gl='git log'
# config files alias
alias nv='nvim'
alias nvimconf="nvim $DOTFILES/nvim/.config/nvim/init.vim"
alias zconf="nvim $XDG_CONFIG_HOME/zsh/.zshrc"
alias zsource="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias aweconf="nvim $XDG_CONFIG_HOME/awesome/rc.lua"
#luamake alias for lua-lsp
alias luamake=/home/krosis/personal/github/lua-language-server/3rd/luamake/luamake
#load syntax highlight: MAKE SURE IS LAST
source "$XDG_CONFIG_HOME/zsh/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 2>/dev/null

#load starship prompt
eval "$(starship init zsh)"

