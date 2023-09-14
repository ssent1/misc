#!/bin/zsh
var () {
local x=$1
  if [[ $x =~ test ]]; then
    echo 'The argument contains the string "test".'
  else
    echo 'The arg DOES NOT contain the string "test".'
  fi
}

: '
var beta
The arg DOES NOT contain the string "test".

var beta-test
The argument contains the string "test".

var beta-test-alpha
The argument contains the string "test".

This is a shell script written in the Zsh shell. It defines a function named `var` that takes one argument.

The function sets a local variable `x` to the value of the first argument passed to the function using the `local`
keyword. It then checks if the value of `x` matches the regular expression "test" using the `=~` operator.

If `x` matches the regular expression "test", the function prints the string "The argument contains..." Otherwise, it
prints the string "The arg DOES NOT contain..."

Execute the script from the command line with an argument to the `var` function, like this: `./script.sh argument`.
The function checks if the argument contains the string "test" and print a message indicating whether it does or not.

Create multiline comments in Zsh
: [ arg ... ]
: '[ multiline-arg ... ]'

This command does nothing. A zero exit status is returned.
[colon - Apple Open Source](https://opensource.apple.com/source/zsh/zsh-65/zsh/Doc/help/colon)
https://stackoverflow.com/a/43158193/13815009
'
