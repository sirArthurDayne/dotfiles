#!/usr/bin/env zsh
# Install script for dotfiles
#Make sure $DOTFILES & $STOW_FOLDERS exists inside .zshenv or .zshrc file

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "INSTALLING $folder"
    stow -D $folder
    stow $folder
done

popd
