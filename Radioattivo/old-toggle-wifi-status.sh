on alfred_script(q)
set wifi to (do shell script "networksetup -listallhardwareports | grep -A 1 Wi-Fi | tail -n 1 | cut -b 9-12")
if (offset of "On" in (do shell script "networksetup -getairportpower " & wifi & " ")) > 0 then
do shell script "networksetup -setairportpower " & wifi & " off"
    set output to (" off")
else
do shell script "networksetup -setairportpower " & wifi & " on"
    set output to (" on")
do shell script "networksetup -setairportnetwork en1 KPL-CountryHills"
    set output to (" connecting to KPL-CountryHills")
end if
end alfred_script
