#!/usr/bin/env zsh

rainbow() {
    for i in {0..255}; 
    do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%16)):#15}:+$'\n'}; 
    done
}

# app     :  
# ver     : 1.0
# ---
# file    :  
# title   : rainbow
# subject : print all 256 ANSI termcolors & codes
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
# > 2022-03-03T17:33:08-0500
# + 2022-03-03T17:33:08-0500
