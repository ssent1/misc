# Zsh Script to Scrape Local Gas Prices

## main prompt

Help me write a Zsh script to parse the price of "Regular" gas from gasbuddy.com. The url for my local gas station is: https://www.gasbuddy.com/station/198389.

Right now, it's listing "160.6¢" as the current price.

I can't find API documentation, so I don't think one exists for this site.

## logging prompt

### Run script in the background

```vim
nohup . /Users/syd/Code/misc/scripts/gas/get-gas-price.zsh &

" stop the script
ps aux | grep get-gas-price.zsh
kill <PID>
```

### run script as a service

On macOS, would it make sense to consider running `log-gas-price.zsh` as a "service" (Daemon or Agent) via launchd?

Yes, using launchd to run log-gas-price.zsh as a service on macOS is an excellent idea. This approach offers several advantages:

-  __Persistence__: The script will automatically start on system boot, ensuring continuous operation without manual intervention.
-  __Reliability__: launchd can restart the script if it crashes or if the system reboots unexpectedly.
-  __Resource management__: launchd can manage system resources more efficiently than a continuously running shell script.
-  __Logging__: launchd provides built-in logging capabilities, which can be helpful for troubleshooting.
-  __Scheduling__: While your script already handles its own scheduling, launchd offers additional scheduling options if needed.

To set this up, you would create a property list (plist) file in the ~/Library/LaunchAgents/ directory. Here's an example of what the plist file might look like:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.syd.gaspricelogger</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/zsh</string>
        <string>/Users/syd/Code/misc/scripts/gas/log-gas-price.zsh</string>
    </array>
	<key>ServiceDescription</key>
	<string>Gas Price Logger</string>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/tmp/gaspricelogger.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/gaspricelogger.err</string>
</dict>
</plist>
```


```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.syd.gaspricelogger</string>
    <key>ProgramArguments</key>
    <array>
        <string>/Users/syd/Code/misc/scripts/gas/log-gas-price.zsh</string>
    </array>
    <key>ServiceDescription</key>
    <string>Gas Price Logger</string>
    <key>EnvironmentVariables</key>
    <dict>
        <key>PATH</key>
        <string>/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
    </dict>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <dict>
        <key>SuccessfulExit</key>
        <false/>
    </dict>
    <key>ThrottleInterval</key>
    <integer>60</integer>
    <key>StandardOutPath</key>
    <string>/tmp/gaspricelogger.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/gaspricelogger.err</string>
</dict>
</plist>
```

```vim
" Load the service with
launchctl load ~/Library/LaunchAgents/local.gaspricelogger.plist

" check Plist logs
vim /private/tmp/gaspricelogger.log /private/tmp/gaspricelogger.err
```

- - -
<!-- sources -->
[1]: https://claude.ai/chat/88b08358-7146-495d-b013-24e0c7967d59 "Zsh Script to Scrape Local Gas Prices"
[2]: https://chatgpt.com/c/6f81cefa-b664-4cfe-a2e8-f3e9d17753a4 "Run script as a service"

Tags: 

^ 2024-07-04T14:24:50-0400\
% 2024-07-04T16:40:23-0400
