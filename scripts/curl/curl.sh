tell application "Safari" to tell document 1
	set the clipboard to "[1]: " & URL & " \"" & name & "\""
end tell
