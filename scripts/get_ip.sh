#!/bin/bash
i=$(curl -s -w "\n" ifconfig.me/ip)
print "$i" | pbcopy && print "$i" && unset i
