display dialog "Name of the browser?" default answer "Safari"
set inp to text returned of result

tell application "System Events"
	if inp is "Google Chrome" then
		tell application "Google Chrome" to return URL of active tab of front window
	else if inp is "Safari" then
		tell application "Safari" to return URL of front document
	else if inp is "Firefox" then
		tell application "Firefox" to activate
		tell application "System Events"
			keystroke "l" using command down
			keystroke "c" using command down
		end tell
		delay 0.5
		return the clipboard
	else
		return
	end if
end tell


tell application "Safari" to tell document 1
	set the clipboard to "[1]: " & URL & " \"" & name & "\"" & return
end tell
