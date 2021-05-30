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

    echo "</items>"
)

# script: sudo nmap -sP 192.168.1.0/24
# Max width for viewing 100% of item is 67 characters
#
# [1]: https://www.shellcheck.net/ "ShellCheck – shell script analysis tool
# updated: 20210530_012733
