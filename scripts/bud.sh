#!/usr/bin/env bash

while :; do
  printf "\033c\n"
  local IFS=/
  vared -ca -p "Please enter the absolute path to your source directory?" src
  vared -ca -p "Please enter the absolute path to your destination directory?" dest
  printf "\n"
  print "Source: $src"
  print "Target: $dest"
  printf "\n"
  if read -qr "choice?Press [Y/y] if this is correct: "; then
    now=$(date +%FT%H%M%S%z)
    destPath="$dest/$dest:t-$now".tar.gz
    printf "\n\n"
    print "Creating an archive in $dest/$dest:t"
    tar -cpzf "$destPath" "$src" #create backup in archive format
    unset src dest
    return
  fi
done

# getDir() {}
# while : ~ while true
# N.B. `:` is better than `true` for portability
# tar -cpzf
#     -c --create a new archive
#     -p --preserve-permissions
#     -z --gzip, --gunzip --ungzip
#     -f --file ARCHIVE

# app     : bud
# ver     : 1.0
# ---
# file    : bud.sh
# title   : bud (backup directory)
# subject : archive CD/DVD volumes or ad hoc directories
# author  : Syd Salmon
# company : Proganica Brand Development
# comments:
# keywords: utility
# ---
# GNU General Public License
# Copyright (C) 2021 Syd Salmon
# This program comes with ABSOLUTELY NO WARRANTY.
# This is free software. You are welcome to redistribute it.
# Attract more good karma! Credit the author.
# ---
# > 2021-07-26T18:37:11-0400
# + 2021-07-28T08:48:28-0400
#
# [1]: https://medium.com/@fotios.floros/linux-backup-script-1722cc9c2bf6 "Linux Backup Script."
# [2]: https://stackoverflow.com/questions/3224878/what-is-the-purpose-of-the-colon-gnu-bash-builtin/3224910#3224910 "purpose of the : (colon) GNU Bash builtin"
# [3]: https://newbedev.com/how-can-i-prompt-for-yes-no-style-confirmation-in-a-zsh-script "Prompt for yes/no: zsh"
# [4]: https://stackoverflow.com/questions/18791882/how-to-make-program-go-back-to-the-top-of-the-code-instead-of-closing
# [5]: https://stackoverflow.com/questions/15174121/how-can-i-prompt-for-yes-no-style-confirmation-in-a-zsh-script
