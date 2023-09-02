#!/bin/zsh
du -hd 1 | sort -hr

# du   : Get a list of files and their sizes.
# -d 1 : Limit output to one level of subdirectories.
# -h   : Human-readable, display disk usage in human-readable format, unit suffixes : B, KB, MB, GB, TB and PB.

# sort
# -h : --human-numeric-sort, sort files by size in a human-readable format, units: B, KB, MB, GB, TB and PB.
# -r : --reverse, Sort in reverse (descending) order.

# This script identifies and sort files on a macOS hard disk drive from largest to smallest.

# To run: 
# chmod +x script
# ./script
