#!/usr/bin/env bash

VIMRC=~/.vimrc

if [ ! -f "$VIMRC" ]; then
  echo "Linking VIMRC"
  ln -s ~/.vim/.vimrc $VIMRC
fi

NVIM=~/.config/nvim
if [ ! -d "$NVIM" ]; then
  echo "Linking NVIM directory"
  ln -s ~/.vim/nvim $NVIM
fi
