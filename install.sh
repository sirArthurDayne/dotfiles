#!/bin/bash

pushd $DOTFILES
for folder in "${STOW_FOLDERS[@]}"
do
	echo $folder
done
popd
