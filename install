#!/usr/bin/env zsh
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/lua

# remove the nvim folder and link every .vim or .lua file
for f in `find . -regex ".*\.vim$\|.*\.lua$"`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/personal/dotfiles/$f ~/.config/nvim/$f
done
