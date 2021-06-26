#! /bin/zsh
function RB() {
  if read -qr "CHOICE?Press \[Yy\] to run brewster: "; then
    brewster
    return 0
  else
    return 1
  fi
}

# help: man zshbuiltins | less +/"read \["
# man zshbuiltins | less +/"return \[ n \]"
# man zshbuiltins | less +/"exit \[ n \]"
# https://stackoverflow.com/questions/15174121/how-can-i-prompt-for-yes-no-style-confirmation-in-a-zsh-script "yes/no"
# ^ 2021-06-26T10:26:07-0400  
# % 2021-06-26T10:26:07-0400
