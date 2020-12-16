#!/bin/sh
i=$(curl -s -w "\n" ifconfig.me/ip)
printf "$i" | pbcopy && printf "$i" && unset i