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
					return "Connecting…"
				else
					if exists menu item "Disconnect" of menu 1 then
						click menu item "Disconnect" of menu 1
						return "Disconnecting…"
					else
						click btMenu
						return "Hey! I can't `Connect`. Are connected to another device?"
					end if
				end if
			end tell
		end tell
	end tell
end tell
