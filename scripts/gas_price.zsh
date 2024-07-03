#!/bin/zsh

unset url stn content price rtime GREEN NC
# URL of the gas station and Top 10: Cheap Fuel Prices in Kitchener, ON
url="https://www.gasbuddy.com/station/198389"
# top="https://www.gasbuddy.com/gasprices/ontario/kitchener"

# Station name
stn="Pioneer @ 1205 Fischer-Hallman Rd"

# Use curl to fetch the webpage and extract the price and reported time
content=$(curl -s "$url")
# top10=$(curl -s "$top")

price=$(echo "$content" | 
  grep -o 'FuelTypePriceDisplay-module__price___3iizb">[0-9.]*¢</span>' | 
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
GREEN='\033[0;32m'
NC='\033[0m'
echo "Regular gas: ${GREEN}\$$price_float${NC}\n$stn, ~$rtime"

unset url stn content price rtime GREEN NC

# lowest price

# sources
# https://claude.ai/chat/88b08358-7146-495d-b013-24e0c7967d59 "Zsh Script to Scrape Local Gas Prices - Claude"

# ^ 2024-06-28T13:53:54-0400\
# % 2024-07-03T15:56:31-0400
