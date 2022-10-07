# !/bin/zsh
dev=en1               # target device
srv=Wi-Fi             # target service
net=KPL-CountryHills  # target wireless network

# hardware & service check
hdwr=$(networksetup -listallhardwareports | grep $srv | cut -f 2 -d :)  # => Wi-Fi; verifies radio hardware is recognized; cut -f 2 -d : => grab field using : (colon) as a delimiter
serv=$(networksetup -listallnetworkservices | grep $hdwrW)              # => Wi-Fi; verifies service is recognized
hdwr=$(networksetup -listallhardwareports | grep $dev | cut -f 2 -d :)  # => en1; verifies device
devs=$(networksetup -getairportpower $dev)                              # => Wi-Fi Power (en1): On; verfies port is recognized

# validate conditions; start or stop services as necessary

if 

networksetup -setairportpower en1 on 

networksetup -setairportnetwork en1 KPL-CountryHills
wifi=$(networksetup -getairportpower $dev)
ssid=$(networksetup -getairportnetwork $dev)
cat << EOF
<?xml version="1.0"?>
<items>
    <item uid="com.sydsalmon.radioattivo" arg="$wifi" valid="yes" type="file">
    <title>Wi-Fi Status</title>
    <subtitle>$wifi :: $ssid</subtitle>
    <icon type="file">wifi-logo.png</icon>
    </item>
</items>
EOF
