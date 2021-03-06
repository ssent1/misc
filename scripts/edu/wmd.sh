#! /bin/bash
# @@@--> NOT WORKING PROPERLY IN BASH <--@@@
# get the following
#   wmd:h -> /root/user/parent/dir/subdir/basename.ext:h
#   wmd:t -> /root/user/parent/dir/subdir/basename.ext:t
#   wmd:r -> /root/user/parent/dir/subdir/basename.ext:r
#   wmd:e -> /root/user/parent/dir/subdir/basename.ext:e
#   wmd:p -> /root/user/parent/dir/subdir/basename.ext:p
#   wmd:q -> /root/user/parent/dir/subdir/basename.ext:q
#   wmd:x -> /root/user/parent/dir/subdir/basename.ext:x

# should get
#   wmd:h -> /root/user/parent/dir/subdir
#   wmd:t -> basename.ext
#   wmd:r -> /root/user/parent/dir/subdir/basename
#   wmd:e -> ext
#   wmd:p -> /root/user/parent/dir/subdir/basename.ext:p
#   wmd:q -> /root/user/parent/dir/subdir/basename.ext
#   wmd:x -> /root/user/parent/dir/subdir/basename.ext:x

# test Bash "Word Modifiers and Designators"
unset wmd
printf "\033c\n"
wmd=/root/user/parent/dir/subdir/basename.ext
echo "wmd:h -> $wmd:h"
echo "wmd:t -> $wmd:t"
echo "wmd:r -> $wmd:r"
echo "wmd:e -> $wmd:e"
echo "wmd:p -> $wmd:p"
echo "wmd:q -> $wmd:q"
echo "wmd:x -> $wmd:x"
unset wmd
# help: $ man bash | less +/"^HISTORY EXPANSION"
# INFO
# app     : wmd
# ver     : 1.0
# ---
# file    : wmd.sh
# title   : Word Modifiers and Designators
# subject : parsing pathnames via command line
# author  : Syd Salmon
# company : Proganica Brand Development
# comments: test and validate pathname modifiers
# keywords: command line cli, linux, bash, zsh shell
# ---
# GNU General Public License
# Copyright (C) 2021 Syd Salmon
# This program comes with ABSOLUTELY NO WARRANTY.
# This is free software. You are welcome to redistribute it.
# Attract more good karma! Credit the author.
# ---
# > 2021-06-25T15:08:35-0400
# + 2021-06-25T15:08:35-0400
