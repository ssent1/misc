use framework "Foundation"
use scripting additions
current application's NSThread's sleepForTimeInterval:1

tell application "System Preferences"
	reveal anchor "output" of pane id "com.apple.preference.sound"
end tell

tell application "System Events" to tell process "System Preferences"
repeat until exists tab group 1 of window 1
end repeat
tell tab group 1 of window 1
	click radio button "Output"
	-- Handles the case where neither primary output is active
	if not (selected of row 4 of table 1 of scroll area 1) then
		set selected of row 4 of table 1 of scroll area 1 to true
		set deviceselected to "USB Audio Device"
		return "🔈 Speakers"
	else if (selected of row 4 of table 1 of scroll area 1) then
		set selected of row 6 of table 1 of scroll area 1 to true
		return "🎧 Headphones, Yeti"
	else if (selected of row 6 of table 1 of scroll area 1) then
		set selected of row 4 of table 1 of scroll area 1 to true
		set deviceselected to "USB Audio Device"
		return "🔈 Speakers"
	end if
end tell
end tell

delay 2

if application "System Preferences" is running then
	quit application "System Preferences"
end if

(*
To update, go to: ":norm 15G33|" or "vim '+norm 15G33|' suono.sh"
- [ ] update "row" number
- [ ] update "deviceselected", if necessary
- [ ] run as "osascript" (AS - AppleScript) in Alfred

Table 12-2. Common kill signals

SIGHUP. | 01  | Hangup      
SIGINT. | 02  | Interrupt   
SIGKILL | 09  | Kill        
SIGTERM | 15  | Terminate   
SIGSTOP | 17  | Stop process
SIGSTOP | 19  | Stop process
SIGSTOP | 23  | Stop process

https://linux.die.net/Bash-Beginners-Guide/sect_12_01.html "Signals"
*)
