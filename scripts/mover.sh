#!/bin/zsh

target_dir="/Users/syd/Dropbox/nvalt/music/songs/worship"
source_dir="/Users/syd/Dropbox/nvalt/music/songs/sacred"

# Move files from source to target directory if they don't exist in target directory
for file in $source_dir/*; do
    filename=$(basename "$file")
    if [ ! -f "$target_dir/$filename" ]; then
        mv "$file" "$target_dir"
        echo "Moved $filename to worship directory."
    fi
done

# Compare and move files with the same filename if source file is newer
for file in $source_dir/*; do
    filename=$(basename "$file")
    target_file="$target_dir/$filename"
    if [ -f "$target_file" ]; then
        source_mtime=$(stat -f "%m" "$file")
        target_mtime=$(stat -f "%m" "$target_file")
        if [ $source_mtime -gt $target_mtime ]; then
            mv "$file" "$target_dir"
            echo "Moved newer version of $filename to worship directory."
        fi
    fi
done

my-hope-is-bulit-shane-and-shane.md
my-hope-is-built-shane-and-shane.md
