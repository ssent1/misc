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
		if (selected of row 1 of table 1 of scroll area 1) then
			set selected of row 6 of table 1 of scroll area 1 to true
			set deviceselected to "USB Audio Device"
			return "🔈 Speakers"
			
			tell (delay 2)
				tell application "System Events"
					set SUONO to (unix id of process "System Preferences")
					do shell script "kill -3 " & SUONO
					# display dialog SUONO
				end tell
			end tell
		else
			set selected of row 1 of table 1 of scroll area 1 to true
			return "🎧 Headphones"
			
			tell (delay 2)
				tell application "System Events"
					set SUONO to (unix id of process "System Preferences")
					do shell script "kill -3 " & SUONO
					# display dialog SUONO
				end tell
			end tell
		end if
	end tell
end tell

(*
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
