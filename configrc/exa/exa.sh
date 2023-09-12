#!/usr/bin/env zsh
file="$HOME/.exarc"
[[ -f "$file" ]] || touch "$file"
opts=("${(f)"$(<"$file")"}")
/usr/local/bin/exa "${opts[@]}" "$@"
