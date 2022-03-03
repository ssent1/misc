#!/bin/zsh

ejectall() {
    total=0
    ejected=0

    for v in /Volumes/*; do
        if [[ $v != *"Preboot"* && $v != *"Calvin" && $v != *"com.apple.TimeMachine"* ]]; then
            echo "Ejecting $v..."
            diskutil eject "$v"

            if [ $? -eq 0 ]; then
                ejected=$(($ejected + 1))
            fi
            total=$(($total + 1))
        fi
    done

    if [ $total -eq 0 ]; then
        echo "No drives to eject"
    else
        msg="$ejected drive(s) ejected"
        failed=$(($total - $ejected))
        if [ $failed -gt 0 ]; then
            msg="$msg, $failed drive(s) failed to eject"
        fi
        echo "$msg"
    fi
    cd "$HOME"/Dropbox/nvalt_repo/ || return
}

# https://apple.stackexchange.com/questions/370406/how-to-eject-all-drives-from-the-command-line

# app     :
# ver     : 1.0
# ---
# file    :
# title   :
# subject :
# author  : Syd Salmon
# company : Proganica Brand Development
# comments:
# keywords:
# ---
# GNU General Public License
# Copyright (C) 2022 Syd Salmon
# This program comes with ABSOLUTELY NO WARRANTY.
# This is free software. You are welcome to redistribute it.
# Attract more good karma! Credit the author.
# ---
# > 2022-02-28T16:01:32-0500
# + 2022-02-28T16:01:32-0500ejectall() {