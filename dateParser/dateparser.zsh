#! /usr/local/bin/zsh
printf "\033c"
echo "Please enter date..."
while :; do
  read INPUT_STRING
  set MON=""
  case $INPUT_STRING in
  jan | Jan | JAN | jan. | Jan. | JAN. | january | January | JANUARY)
    MON="01"
    printf "\033c"
    printf "%s\n" "" "$INPUT_STRING ==> month $MON"
    break
    ;;
  feb | Feb | FEB | feb. | Feb. | FEB. | february | February | FEBRUARY)
    MON="02"
    printf "\033c"
    printf "%s\n" "" "$INPUT_STRING ==> month $MON"
    break
    ;;
  mar | Mar | MAR | mar. | Mar. | MAR. | march | March | MARCH)
    MON="03"
    printf "\033c"
    printf "%s\n" "" "$INPUT_STRING ==> month $MON"
    break
    ;;
  apr | Apr | APR | apr. | Apr. | APR. | april | April | APRIL)
    MON="04"
    printf "\033c"
    printf "%s\n" "" "$INPUT_STRING ==> month $MON"
    break
    ;;
  may | may | May | May | MAY | MAY | may. | May. | MAY)
    MON="05"
    printf "\033c"
    printf "%s\n" "" "$INPUT_STRING ==> month $MON"
    break
    ;;
  jun | Jun | JUN | jun. | Jun. | JUN. | june | June | JUNE)
    MON="06"
    printf "\033c"
    printf "%s\n" "" "$INPUT_STRING ==> month $MON"
    break
    ;;
  jul | Jul | JUL | jul. | Jul. | JUL. | july | July | JULY)
    MON="07"
    printf "\033c"
    printf "%s\n" "" "$INPUT_STRING ==> month $MON"
    break
    ;;
  aug | Aug | AUG | aug. | Aug. | AUG. | august | August | AUGUST)
    MON="08"
    printf "\033c"
    printf "%s\n" "" "$INPUT_STRING ==> month $MON"
    break
    ;;
  sep | Sep | SEP | sep. | Sep. | SEP. | september | September | SEPTEMBER)
    MON="09"
    printf "\033c"
    printf "%s\n" "" "$INPUT_STRING ==> month $MON"
    break
    ;;
  oct | Oct | OCT | oct. | Oct. | OCT. | october | October | OCTOBER)
    MON="10"
    printf "\033c"
    printf "%s\n" "" "$INPUT_STRING ==> month $MON"
    break
    ;;
  nov | Nov | NOV | nov. | Nov. | NOV. | november | November | NOVEMBER)
    MON="11"
    printf "\033c"
    printf "%s\n" "" "$INPUT_STRING ==> month $MON"
    break
    ;;
  dec | Dec | DEC | dec. | Dec. | DEC. | december | December | DECEMBER)
    MON="12"
    printf "\033c"
    printf "%s\n"" "" "$INPUT_STRING" ==> month $MON"
    break
    ;;
  *)
    printf "%s\n" "Sorry, invalid date format." "Please try again..." ""
    ;;
  esac
done
today=$(date +"%A")
printf "%s\n" "" "Make it a great $today!"
unset MON INPUT_STRING
