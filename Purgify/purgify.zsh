#!/bin/zsh
find ~ -name ".DS_Store" -exec rm -Rf {} \; 2> /dev/null
find ~ -name ".apdisk" -exec rm -Rf {} \;  2> /dev/null
find ~ -name ".AppleDouble" -exec rm -Rf {} \; 2> /dev/null
find ~ -name ".AppleDB" -exec rm -Rf {} \; 2> /dev/null
find ~ -name "afpd.core" -exec rm -Rf {} \; 2> /dev/null
find ~ -name ".TemporaryItems" -exec rm -Rf {} \; 2> /dev/null
find ~ -name "__MACOSX" -exec rm -Rf {} \; 2> /dev/null
