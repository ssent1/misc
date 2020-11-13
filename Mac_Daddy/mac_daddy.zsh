(
    IFS=$'\n'
    match=("$(grep -i {query} mac_daddy)")
    echo '<?xml version="1.0"?>'
    echo '<items>'
    echo ''

    for i in "${match[@]}"; do
        macaddr=("$(echo "$i" | cut -d\, -f1)")
        device=("$(echo "$i" | cut -d\, -f4)")
        ipaddr=("$(echo "$i" | cut -d\, -f3)")

        echo "<item arg=\"$macaddr\" valid=\"yes\">"
        echo "<title>$device ↔︎ $ipaddr ↔︎ $macaddr</title>"
        echo "<subtitle>☛ Run "sudo nmap -sP 192.168.1.0/24" if IP is outdated.</subtitle>"
        echo "<icon>mac_daddy.png</icon></item>"
        echo ""
    done

    echo "</items>"
)

# script: sudo nmap -sP 192.168.1.0/24
# Max width for viewing 100% of item is 67 characters
#
# [1]: https://www.shellcheck.net/ "ShellCheck – shell script analysis tool<!--- RESOURCES & SOURCES -->
# updated: *20201112_225058*

