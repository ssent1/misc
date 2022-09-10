# the new version of blueutil now allows device activation, it's likely better
# to rewrite this as a shell script, not as an Apple Script.
# see connect*.scpt
# this script may now be redundant

activate application "SystemUIServer"
tell application "System Events"
	tell process "SystemUIServer"
		set btMenu to (menu bar item 1 of menu bar 1 whose description contains "Bluetooth")
		tell btMenu
			click
			tell (menu item "Tracer" of menu 1)
				click
				if exists menu item "Connect" of menu 1 then
					click menu item "Connect" of menu 1
					return "Tracer (Apple Magic Mouse) connected."
				else
					if exists menu item "Disconnect" of menu 1 then
						click menu item "Disconnect" of menu 1
						return "Tracer (Apple Magic Mouse) disconnected."
					else
						click btMenu
						return "Hey! I can't connect your Bluetooth mouse. Is it on?"
					end if
				end if
			end tell
		end tell
	end tell
end tellactivate application "SystemUIServer"

# return status
activate application "SystemUIServer"
tell application "System Events"
	tell process "SystemUIServer"
		set btMenu to (menu bar item 1 of menu bar 1 whose description contains "Bluetooth")
		tell btMenu
			click
			tell (menu item "Tracer" of menu 1)
				click
				if exists menu item "Disconnect" of menu 1 then
					return "Tracer (Apple Magic Mouse) connected."
				else
					if exists menu item "Connect" of menu 1 then
						return "Not connected."
					else
						click btMenu
						return "Hey! I can't find your Bluetooth mouse. Is it paired?"
					end if
				end if
			end tell
		end tell
	end tell
end tell
