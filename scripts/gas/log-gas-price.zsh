#!/bin/zsh

log_file="$HOME/Code/misc/scripts/gas/gas-price.log"
script_path="/Users/syd/Code/misc/scripts/gas/get-gas-price.zsh"

log_gas_price() {
    . "$script_path"
    get_gas_price
    echo "$(date +%F$'\t'%H:%M:%S)\t $price_float" >> "$log_file"
}

log_gas_price

# sources
## https://claude.ai/chat/88b08358-7146-495d-b013-24e0c7967d59 "Zsh Script to Scrape Local Gas Prices"
## https://chatgpt.com/c/6f81cefa-b664-4cfe-a2e8-f3e9d17753a4 "Run script as a service"

# ^ 2024-06-28T13:53:54-0400\
# % 2024-07-04T23:39:17-0400
