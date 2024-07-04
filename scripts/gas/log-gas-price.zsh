#!/bin/zsh

log_file="$HOME/Code/misc/scripts/gas/gas-price.log"
script_path="$HOME/Code/misc/scripts/gas/get-gas-price.zsh"

log_price() {
    ${script_path}
    echo "$(date +%F$'\t'%H:%M:%S)\t $price_float" >> "$log_file"
}

# Function to check if current time is between 07:00 and 23:59
is_valid_time() {
    local current_hour=$(date +%H)
    if (( current_hour >= 7 && current_hour < 24 )); then
        return 0
    else
        return 1
    fi
}

# Function to calculate seconds until next run time
seconds_until_next_run() {
    local current_hour=$(date +%H)
    local current_minute=$(date +%M)
    local current_second=$(date +%S)
    
    # Calculate the next run hour
    local next_run_hour=$(( (current_hour - 7 + 3) / 3 * 3 + 7 ))
    if (( next_run_hour > 22 )); then
        next_run_hour=7
    fi
    
    # Calculate seconds until next run
    local seconds_to_next=$((
        (next_run_hour - current_hour) * 3600 
        - current_minute * 60 
        - current_second
    ))
    
    # If next run is tomorrow, add 24 hours
    if (( seconds_to_next < 0 )); then
        seconds_to_next=$((seconds_to_next + 24 * 3600))
    fi
    
    echo $seconds_to_next
}

# Main loop
while true; do
    if is_valid_time; then
        log_price
    fi
    
    sleep_seconds=$(seconds_until_next_run)
    sleep $sleep_seconds
done

# sources
# https://claude.ai/chat/88b08358-7146-495d-b013-24e0c7967d59 "Zsh Script to Scrape Local Gas Prices - Claude"

# ^ 2024-06-28T13:53:54-0400\
# % 2024-07-04T15:31:42-0400
