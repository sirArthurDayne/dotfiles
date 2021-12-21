# XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

#default programs
export EDITOR="nvim"
export BROWSER="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"

#disable lesshistory
export LESSHISTFILE=-

# User configuration
export MANPAGER="nvim -c 'set ft=man' -"
export DOTFILES=$HOME/personal/dotfiles

#add Golang into $PATH
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:"$HOME/personal/GoProyects"
