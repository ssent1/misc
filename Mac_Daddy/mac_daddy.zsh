(
    IFS=$'\n'
    array=("$(grep -i {query} DBmacDaddy)")

    printf "%s\n" '<?xml version="1.0"?>'
    printf "%s\n" '<items>'
    printf "%s\n" ''

    for i in "${array[@]}"; do
        macaddr=("$(printf "%s\n" "$i" | cut -d\, -f1)")
        device=("$(printf "%s\n" "$i" | cut -d\, -f4)")
        ipaddr=("$(printf "%s\n" "$i" | cut -d\, -f3)")

        # concatenate variables
        output="$macaddr --> ($device)"

        # return value(s) to {query} in Alfred
        printf "%s\n" "<item arg=\"$output\" valid=\"yes\">"

        # display output in Alfred's GUI
        printf "%s\n" "<title>$device ↔︎ $ipaddr ↔︎ $macaddr</title>"
        printf "%s\n" "<subtitle>|-> Run 'sudo nmap -sP 192.168.1.0/24' if IP is outdated.</subtitle>"
        printf "%s\n" "<icon>mac_daddy.png</icon></item>"
        printf "%s\n" ""

    done

    printf "%s\n" "</items>"
)

# script: sudo nmap -sP 192.168.1.0/24
# Max width for viewing 100% of item is 67 characters
#
# [1]: https://www.shellcheck.net/ "ShellCheck – shell script analysis tool
# updated: 20210530_012733
