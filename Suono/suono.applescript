tell application "System Preferences"
	reveal anchor "output" of pane id "com.apple.preference.sound"
end tell
tell application "System Events" to tell process "System Preferences"
	repeat until exists tab group 1 of window 1
	end repeat
	tell tab group 1 of window 1
		click radio button "Output"
		if (selected of row 1 of table 1 of scroll area 1) then
			set selected of row 5 of table 1 of scroll area 1 to true
			set deviceselected to "C-Media USB Audio Device"
			return "🔈Panasonic RX-DT680 S-XBS Stereo"
		else
			set selected of row 1 of table 1 of scroll area 1 to true
			return "🎧Sony MDR-7506 Pro Headphones"
		end if
	end tell
end tell
delay 2
if application "System Preferences" is running then
	tell application "System Preferences" to quit
end if