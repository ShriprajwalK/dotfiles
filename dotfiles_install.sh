#!/bin/bash
dotfiles=(".vimrc" ".tmux.conf")
dir="${HOME}/dotfiles"
for dotfile in "${dotfiles[@]}";do
 ln -sf "${HOME}/${dotfile}" "${dir}" 
done
