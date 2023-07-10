#!/bin/zsh
define() {
  word="$1"
  #response
  #matches
  #match_count
  #choice

  response=$(curl -s "dict://dict.org/d:$word")
  if [[ $response =~ "552 no match" ]]; then
    echo "Word not found. Trying to find spelling suggestions..."
    response=$(curl -s "dict://dict.org/m:$word")
    if [[ $response = ~"552 no match" ]]; then
      echo "No suggestions found. Please enter a new word or type 'q' to quit:"
      read -r choice
      if [[ $choice != "q" ]]; then
        define "$choice"
      else
        echo "No suggestions found. Exiting ..."
        return 1
      fi
    else
      matches=("${(@f)$(echo "$response" | sed -n 's/.*"\(.*\)"/\1/p')}") # Extract matched words
        match_count=${#matches[@]}
        echo "$match_count matches found"
        for i in {1..$match_count}; do
          echo "$i) ${matches[$i]}"
        done
        echo "q) quit"
        echo "Please choose a word by entering its number or type 'q' to quit:"
        read -r choice
        if [[ $choice != "q" ]]; then
          define "${matches[$choice]}"
        else
          echo "No suggestions match. Exiting ..."
          return 2
        fi
    fi
  else
    echo "$response"
  fi
}

if [[ -z $1 ]]; then
  echo "Usage: def <word>"
else
  define "$1"
fi

# parameter expansion flags
# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Parameter-Expansion
# "${(@f)}"
# @ => put array elements into separate words
# f => split the result of the expansion at newlines
# [1]: https://linuxhint.com/50_sed_command_examples/ "50 sed Command Examples"
