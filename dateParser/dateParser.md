# Date Parser

## Read User Input

## Case Statement

### Basic Month Format

```zsh
MON="Sep"
case word in
Jan)
 MON="01"
 ;;
Feb)
 MON="02"
 ;;
Mar)
 MON="03"
 ;;
Apr)
 MON="04"
 ;;
May)
 MON="05"
 ;;
Jun)
 MON="06"
 ;;
Jul)
 MON="07"
 ;;
Aug)
 MON="08"
 ;;
Sep)
 MON="09"
 ;;
Oct)
 MON="10"
 ;;
Nov)
 MON="11"
 ;;
Dec)
 MON="12"
 ;;
esac
printf "%s\n" "$MON\n"
```

### Interactive Multiple Month Format

```zsh - #! /usr/local/bin/zsh
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
```

- `%A` = locale's full weekday name (e.g., Sunday)
- ..
- `%m` = month (01..12)
- `%d` = day of month (e.g, 01)
- `%H` = hour (00..23)
- `%M` = minute (00..59)
- `%S` = second (00..60)
- `%Y` = year (2099)

## Regular Expressions

```yaml
---
dateParser:
  find:
  '
  /"
  (?<mon>\w+)\s
  (?<day>[3][0-1]|[1][0-9]|[2][0-9]|[0][1-9]|[1-9])\s
  (?<time>\d{2}:\d{2}:\d{2})\s
  (?<year>\d{4})
  "/gmx
  '
  subs: replacement_string
  pool: sub_pool_if_nec
  func: function_purpose
  trig: aText_trigger
  samp: aaa_2_zzz
  test: test_string
  stat: ⍺β_etc
  date:
```

sed -E 's/"(\w+)\s([3][0-1]|[1][0-9]|[2][0-9]|[0][1-9]|[1-9])\s(\d{2}:\d{2}:\d{2})\s(\d{4})"/\1/g' <<< "\"Jun 25 17:27:09 2021\""
sed -E 's/"(\w+)\s([3][0-1]|[1][0-9]|[2][0-9]|[0][1-9]|[1-9])\s(\d{2}:\d{2}:\d{2})\s(\d{4})"/\$1/g' <<< "\"Jun 25 17:27:09 2021\""

sed -E 's/"my name is (\w+)"/$1/g' <<< "\"my name is SYD\""
sed -E 's/\"my name is (\w+)\"/$1/g' <<< "\"my name is SYD\""

sed -E 's/"my name is (\w+)"/\$1/g' <<< "\"my name is SYD\""

sed -E 's/my name is (\w+)/\$1/g' <<< "my name is SYD"

<!-- SOURCES & RESOURCES -->

[1]: https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display "Format Date"
[2]: https://superuser.com/questions/427645/better-way-to-read-a-line-of-user-input-in-zsh-e-g-with-zle "get user input"
[3]: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#index-vared "zsh: 18 Zsh Line Editor"
[4]: https://osxdaily.com/2017/02/06/list-all-terminal-commands-mac "List all macOS Terminal Commands"
[5]: https://bash.cyberciti.biz/guide/The_case_statement "The case statement - Linux Shell Scripting Tutorial"
[6]: https://www.thegeekstuff.com/2010/07/bash-case-statement "5 Bash Case Statement Examples"
[7]: https://linuxize.com/post/how-to-use-sed-to-find-and-replace-string-in-files "sed: Find and Replace"

---

tags: cli, command line, config, linux programming, shellscript, terminal, unix, zsh

created: _20210621_120609_  
modified: 20210621_155046
