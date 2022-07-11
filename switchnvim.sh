#!/usr/bin/env bash

if [[ -z "$1" || "$1" == "lua" ]]; then
    stow -D nvim
    stow nvim-lua
else
    stow -D nvim-lua
    stow nvim
fi
