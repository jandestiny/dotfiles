#!/bin/bash

# Check what shell is being used
SH="${HOME}/.bashrc"
ZSHRC="${HOME}/.zshrc"
if [ -f "$ZSHRC" ]; then
	SH="$ZSHRC"
fi

SCRIPT_DIR="$(dirname "$(realpath "$0")")" # The dir of this script

# Create symbolic link in home dir
if [ ! -e "${HOME}/dotfiles" ]; then
	ln -s "$SCRIPT_DIR" ~/dotfiles
fi

# Modify the shell
echo '# Following lines are installed through the dotfiles repo
if [ -e "dotfiles" ]; then
  for file in dotfiles/shell/*; do
    if [ -f "$file" ]; then
      source "$file"
    fi
  done
fi' >> "$SH"

# Tmux conf
if [ ! -e "${HOME}/.tmux.conf" ]; then
	ln -s "${SCRIPT_DIR}/.tmux.conf" ~/.tmux.conf
fi

# Vim conf
if [ ! -e "${HOME}/.vimrc" ]; then
	ln -s "${SCRIPT_DIR}/.vimrc" ~/.vimrc
fi


echo "Done"
