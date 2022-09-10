# the new version of blueutil now allows device activation, it's likely better
# to rewrite this as a shell script, not as an Apple Script.

activate application "SystemUIServer"
tell application "System Events"
	tell process "SystemUIServer"
		set btMenu to (menu bar item 1 of menu bar 1 whose description contains "Bluetooth")
		tell btMenu
			click
			tell (menu item "JVC HA-A10T" of menu 1)
				click
				if exists menu item "Connect" of menu 1 then
					click menu item "Connect" of menu 1
					return "Connected Bluetooth headphones."
				else
					if exists menu item "Disconnect" of menu 1 then
						click menu item "Disconnect" of menu 1
						return "Disconnected Bluetooth headphones."
					else
						click btMenu
						return "Hey! I can't connect your Bluetooth headphones. Are connected to another device?"
					end if
				end if
			end tell
		end tell
	end tell
end tell

