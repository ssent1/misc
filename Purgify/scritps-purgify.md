# Purgify

## PURGIFY SCRIPT

```sh
touch $HOME/Code/misc/Purgify/purgify.zsh
cat << EOF > $HOME/Code/misc/Purgify/purgify.zsh
find / -name ".DS_Store" -exec rm -Rf {} \;
find / -name ".apdisk" -exec rm -Rf {} \;
find / -name ".AppleDouble" -exec rm -Rf {} \;
find / -name ".AppleDB" -exec rm -Rf {} \;
find / -name "afpd.core" -exec rm -Rf {} \;
find / -name ".TemporaryItems" -exec rm -Rf {} \;
find / -name "__MACOSX" -exec rm -Rf {} \;
EOF
cd $HOME/Code/misc/Purgify/
sudo chmod a+x $HOME/Code/misc/Purgify/purgify.zsh
#
# ★==> END OF SCRIPT <==★
#
cd $HOME/Code/misc/Purgify/ # go to app directory, if not already there
./purgify.zsh               # run Purgify script
```

## AUTOMATE PURGIFY

### launchd expression

```sh
touch $HOME/Library/LaunchAgents/local.purgify.plist
cat << EOF > $HOME/Library/LaunchAgents/local.purgify.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>local.purgify</string>
        <key>ProgramArguments</key>
        <array>
            <string>/bin/zsh</string>
            <string>/Users/syd/Code/misc/Purgify/purgify.zsh</string>
        </array>
        <key>ServiceDescription</key>
        <string>Purgify</string>
    </dict>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>18</integer>
        <key>Minute</key>
        <integer>20</integer>
        <key>Weekday</key>
        <integer>6</integer>
    </dict>
</plist>
EOF
sudo chown root:wheel $HOME/Library/LaunchAgents/local.purgify.plist
cd $HOME/Library/LaunchAgents
#
# Run the following commands to load and start Purgify using launchctl
#
sudo launchctl load $HOME/Library/LaunchAgents/local.purgify.plist
sudo launchctl start $HOME/Library/LaunchAgents/local.purgify
#
# OR do both at the same time
sudo launchctl load $HOME/Library/LaunchAgents/local.purgify.plist && sudo launchctl start $HOME/Library/LaunchAgents/local.purgify
#
# Verify Purgify's running
sudo launchctl list | grep local.purgify
#
# Stop running Purgify's process and unload the daemon service from launchd
sudo launchctl stop local.purgify
sudo launchctl unload $HOME/Library/LaunchAgents/local.purgify.plist
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>local.purgify</string>
        <key>ProgramArguments</key>
        <array>
            <string>/bin/zsh</string>
            <string>/Users/syd/Code/misc/Purgify/purgify.zsh</string>
        </array>
        <key>ServiceDescription</key>
        <string>Purgify</string>
    </dict>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>18</integer>
        <key>Minute</key>
        <integer>20</integer>
        <key>Weekday</key>
        <integer>6</integer>
    </dict>
</plist>
```

### CRON EXPRESSION

```sh
sudo vi /etc/crontab                                     # automate removal
0 30 18 ? * * * root $HOME/Code/misc/Purgify/purgify.zsh # cron runs Purgify "At 18:30:00pm, on every Saturday, every
month."
```

<!--- RESOURCES & SOURCES -->

* * *
Tags: macOS, maintenance, scripts

updated: *20201003_214109*
