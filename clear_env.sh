#!/usr/bin/env zsh
# clear any stow folder sets in STOW_FOLDER variable
#make sure $DOTFILES & $STOW_FOLDERS exists inside .zshenv or .zshrc
pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "REMOVING $folder"
    stow -D $folder
done
popd
