#!/bin/zsh

def() {
  local word="$1"
  local response
  local matches
  local match_count
  local choice

  response=$(curl -s "dict://dict.org/d:$word:gcide")
  if [[ $response =~ "552 no match" ]]; then
    echo "Word not found. Trying to find spelling suggestions..."
    response=$(curl -s "dict://dict.org/m:$word:gcide")
    if [[ $response =~ "552 no match" ]]; then
      echo "No suggestions found. Please enter a new word or type 'q' to quit:"
      read choice
      if [[ $choice != "q" ]]; then
        def "$choice"
      fi
    else
      matches=("${(@f)$(echo $response | grep -oP 'gcide "\K[^"]*')}") # Extract matched words
      match_count=${#matches[@]}
      echo "152 $match_count matches found"
      for i in {1..$match_count}; do
        echo "$i) ${matches[$i]}"
      done
      echo "Please choose a word by entering its number or type 'q' to quit:"
      read choice
      if [[ $choice != "q" ]]; then
        def "${matches[$choice]}"
      fi
    fi
  else
    echo $response
  fi
}

if [[ -z $1 ]]; then
  echo "Usage: def <word>"
else
  def "$1"
fi
