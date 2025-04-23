#!/bin/bash

# Set the source directory (your .config)
source_dir="$HOME/dotfiles"

# Set the target directory where you want the symlinks
target_dir="/home/treyw/.config" # or another path, like "$HOME/.config-backup"

# Check if target directory exists; create it if not
if [ ! -d "$target_dir" ]; then
  echo "Creating target directory: $target_dir"
  mkdir -p "$target_dir" || {
    echo "Failed to create target directory"
    exit 1
  }
fi

# Function to process each config directory
process_directory() {
  local dir_name="$1"

  # Construct the symlink path
  symlink_path="$target_dir/$dir_name"

  # Check if the symlink already exists and is valid
  if [ ! -L "$symlink_path" ]; then
    echo "Creating symlink: $symlink_path -> $source_dir/$dir_name"
    ln -sf "$source_dir/$dir_name" "$symlink_path" || {
      echo "Failed to create symlink for $dir_name"
      exit 1
    }
  else
    echo "Symlink already exists: $symlink_path"
  fi
}

# Main execution
echo "Creating symlinks from $source_dir to $target_dir"

# Loop through all directories in the source directory
for dir in "$source_dir"/*/; do
  if [ -d "$dir" ]; then
    # Extract directory name without path
    dir_name="$(basename "$dir")"
    process_directory "$dir_name"
  fi
done

echo "Done creating symlinks."
