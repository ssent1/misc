#!/usr/bin/env zsh

createDate() {
  GetFileInfo -d !v:$ |
  # gets create date
    sed -E 's/([0-9]{2})[\\/]([0-9]{2})[\\/]([0-9]{4}) ([0-9]{2}:[0-9]{2}:[0-9]{2})/\3-\1-\2T\4-0500/g' |
    # parse date into ISO format ()
    tee /dev/tty | pbcopy
    # print result to terminal AND copy to clipboard
}

# app     : get established (create) date for file
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
# > 2022-03-02T11:10:12-0500
# + 2022-03-02T14:48:22-0500
