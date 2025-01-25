#!/bin/bash

# Get the directory of the script
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Function to create symlink
function create_symlink() {
  source="$DOTFILES_DIR/$1"
  target="$HOME/.config/$1"

  if [ -d "$target" ]; then
    echo "File already exists: $target"
    read -p "Do you want to overwrite? (y/[N]): " answer
    if [ "$answer" != "y" ]; then
      return
    fi
    rm -f "$target"
  fi

  ln -s "$source" "$target"
  echo "Created symlink: $target -> $source"
}

# Create symlinks for dotfiles

create_symlink "alacritty"
create_symlink "kitty"
create_symlink "lazygit"
create_symlink "nvim"
create_symlink "powerline"
create_symlink "tmux"
create_symlink "tmuxp"

# find . -maxdepth 1 -mindepth 1 -type d | while read dir; do
#   echo "$dir"
#   create_symlink "$dir" "$dir"
# done

echo "Symlinks created successfully!"
