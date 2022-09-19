#! /bin/zsh
wifi=$(networksetup -getairportpower en1)
cat << EOF
<?xml version="1.0"?>
<items>
    <item uid="com.sydsalmon.radioattivo" arg="$wifi" valid="yes" type="file">
    <title>Wi-Fi Status</title>
    <subtitle>$wifi</subtitle>
    <icon type="file">wifi-logo.png</icon>
    </item>
</items>
EOF
# https://apple.stackexchange.com/questions/171160/how-to-get-the-wi-fi-connection-status-from-terminal
