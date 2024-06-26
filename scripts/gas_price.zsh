#!/bin/zsh

# URL of the gas station
url="https://www.gasbuddy.com/station/198389"

# Station name
stn="Pioneer @ 1205 Fischer-Hallman Rd"

# Use curl to fetch the webpage and extract the price and reported time
content=$(curl -s "$url")

price=$(echo "$content" | 
  grep -o '<span class="text__xl___2MXGo text__bold___1C6Z_ text__left___1iOw3 FuelTypePriceDisplay-module__price___3iizb">[0-9.]*¢</span>' | 
  head -n 1 | 
  sed 's/.*>\(.*\)<.*/\1/' | 
  sed 's/¢//')

rtime=$(echo "$content" | 
  grep -o 'FuelTypePriceDisplay-module__reportedGrey___g8pgI">[^<]*</p></div>' | 
  head -n 1 | 
  sed 's/.*">\(.*\)<\/p><\/div>/\1/')

# Convert price to a floating-point number
price_float=$(echo $price | awk '{print $1/100}')

# Print the result
# ANSI codes: 1 = bold, 32m = green, 0m = no color
GREEN='\033[1;32m'
NC='\033[0m'
echo "Regular gas: ${GREEN}\$$price_float${NC}\n$stn, ~$rtime"

# - - -

# sources
# https://claude.ai/chat/88b08358-7146-495d-b013-24e0c7967d59 "Zsh Script to Scrape Local Gas Prices - Claude"

# ^ 2024-06-28T13:53:54-0400\
# % 2024-07-01T14:28:34-0400
