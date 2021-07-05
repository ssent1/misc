#!/bin/bash
# mv.sh
dir="$2"
tmp="$2"; tmp="${tmp: -1}"
[ "$tmp" != "/" ] && dir="$(dirname "$2")"
[ -a "$dir" ] ||
mkdir -p "$dir" &&
mv "$@"

#  # mv - script to create directory on `mv` if it doesn't exist
#  
#  ## Steps
#  
#  1. Make file for the script
#  
#  `touch ~{dir}/mv.zsh`
#  
#  #!/bin/bash
#  # mv.sh
#  dir="$2"
#  tmp="$2"; tmp="${tmp: -1}"
#  [ "$tmp" != "/" ] && dir="$(dirname "$2")"
#  [ -a "$dir" ] ||
#  mkdir -p "$dir" &&
#  mv "$@"
#  Or put at the end of your ~/.bashrc file as a function that replaces the default mv on every new terminal. Using a function allows bash keep it memory, instead of having to read a script file every time.
#  
#  function mv ()
#  {
#      dir="$2"
#      tmp="$2"; tmp="${tmp: -1}"
#      [ "$tmp" != "/" ] && dir="$(dirname "$2")"
#      [ -a "$dir" ] ||
#      mkdir -p "$dir" &&
#      mv "$@"
#  }
#  
#  https://stackoverflow.com/questions/547719/is-there-a-way-to-make-mv-create-the-directory-to-be-moved-to-if-it-doesnt-exis "linux - Is there a way to make mv create the directory to be moved to if it doesn't exist? - Stack Overflow"
#  
#  https://www.zsh.org/mla/users/2006/msg00277.html "Re: cd - and $OLDPWD, bug in the manual?"
