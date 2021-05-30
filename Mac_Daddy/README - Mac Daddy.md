# Mac Daddy

## WORK IN PROGRESS

```sh - # ★==> NOT WORKING <==★
(
 IFS=$'\n'
 array=("$(grep -i {query} mac_daddy)")
 # unset IFS
 value=(query)
 echo '<?xml version="1.0"?>'
 echo '<items>'
 echo ''
 if [[ ${value} =~ .*${array[@]}.* ]]; then
   for i in "${array[@]}"; do
     macaddr=("$(echo "$i" | cut -d\, -f1)")
     device=("$(echo "$i" | cut -d\, -f4)")
     ipaddr=("$(echo "$i" | cut -d\, -f3)")
     # concatenate variables
     output="$macaddr --> ($device)"
     # return value(s) to {query} in Alfred
     echo "<item arg=\"$output\" valid=\"yes\">"
     # display output in Alfred's GUI
     echo "<title>$device ↔︎ $ipaddr ↔︎ $macaddr</title>"
     echo "<subtitle>☛ Run 'sudo nmap -sP 192.168.1.0/24' if IP is outdated.</subtitle>"
     echo "<icon>mac_daddy.png</icon></item>"
     echo ""
   done
 else
   # return error message to {query} in Alfred
   echo "<item arg=\"Sorry. No matches for $value found.\" valid=\"yes\">"
   # display output in Alfred's GUI
   echo "<title>Sorry. No matches for $value found.</title>"
   echo "<subtitle>☛ Check info. Update Mac Daddy dB with new device info.</subtitle>"
   echo "<icon>mac_daddy_red.png</icon></item>"
   echo ""
 fi
 echo "</items>"
)
```

## PRODUCTUCTION BACKUP

```sh - productuction backup
# ★==> WORKING <==★
(
 IFS=$'\n'
 array=("$(grep -i {query} mac_daddy)")
 echo '<?xml version="1.0"?>'
 echo '<items>'
 echo ''
 for i in "${array[@]}"; do
   macaddr=("$(echo "$i" | cut -d\, -f1)")
   device=("$(echo "$i" | cut -d\, -f4)")
   ipaddr=("$(echo "$i" | cut -d\, -f3)")
   output="$macaddr --> ($device)"
   echo "<item arg=\"$output\" valid=\"yes\">"
   echo "<title>$device ↔︎ $ipaddr ↔︎ $macaddr</title>"
   echo "<subtitle>☛ Run 'sudo nmap -sP 192.168.1.0/24' if IP is outdated.</subtitle>"
   echo "<icon>mac_daddy.png</icon></item>"
   echo ""
 done
 echo "</items>"
)
```

<!-- SOURCES & RESOURCES -->

[1]: https://superuser.com/questions/1543695/comparing-two-strings-in-zsh "Comparing strings in zsh"
[2]: https://linuxize.com/post/how-to-compare-strings-in-bash/ "Compare Strings in Bash"
[3]: https://zsh.sourceforge.io/Doc/Release/Conditional-Expressions.html "zsh: 12 Conditional Expressions"
[4]: https://www.ibm.com/docs/en/aix/7.2?topic=commands-c-shell-expressions-operators "C shell expressions/operators"
[5]: https://stackoverflow.com/questions/3685970/check-if-a-bash-array-contains-a-value "Check Bash arrays"
[6]: https://tldp.org/LDP/abs/html/arrays.html "Arrays"
[7]: https://zsh.sourceforge.io/Guide/zshguide05.html "A User's Guide to the Z-Shell"
[8]: https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html "Bash Parameter Expansion"
[9]: https://zsh.sourceforge.io/Guide/zshguide02.html#l12 "Z-Shell"
[10]: https://zsh.sourceforge.io/Doc/Release/Expansion.html#Parameter-Expansion-Flags "zsh: 14 Expansion"
[11]: https://johnsiu.com/blog/sh-zsh/ "John Siu Blog | Shell - Zsh"

tags: string comparison, print array matches, zsh

---

tags:

created: _20210530_003523_  
modified: 20210530_011045
