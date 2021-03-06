# Brewster

> Homebrew's estate manager
> Brewster ensures that Homebrew is up-to-date

## Script

```sh
# Script run Homebrew maintenance functions
#
#! /bin/zsh
mkdir $HOME/Code/misc/Brewster
touch $HOME/Code/misc/Brewster/brewster.zsh
cat << EOF > $HOME/Code/misc/Brewster/brewster.zsh
brew update
brew upgrade
brew cleanup
brew doctor
EOF
chmod a+x $HOME/Code/misc/Brewster/brewster.zsh
cd $HOME/Code/misc/Brewster
#
# ~~~ END OF SCRIPT ~~~
#
# run Brewster
./brewster.zsh       # runs script
```

## automate Brewster

### launchd expression

```sh
# launchd ==> best
#
touch ~/Library/LaunchAgents/local.brewster.plist
cat << EOF > ~/Library/LaunchAgents/local.brewster.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
 <dict>
   <key>Label</key>
   <string>local.brewster</string>
   <key>ProgramArguments</key>
   <array>
     <string>/bin/zsh</string>
     <string>/Users/syd/Code/misc/Brewster/brewster.zsh</string>
   </array>
   <key>ServiceDescription</key>
   <string>Brewster</string>
   <key>StartCalendarInterval</key>
   <dict>
     <key>Hour</key>
     <integer>18</integer>
     <key>Minute</key>
     <integer>30</integer>
   </dict>
 </dict>
</plist>
EOF
sudo chown root:wheel ~/Library/LaunchAgents/local.brewster.plist
cd ~/Library/LaunchAgents
#
# Run the following commands to load and start Brewster using launchctl
#
sudo launchctl load ~/Library/LaunchAgents/local.brewster.plist
sudo launchctl start ~/Library/LaunchAgents/local.brewster
#
# OR do both at the same time
# sudo launchctl load ~/Library/LaunchAgents/local.brewster.plist && sudo launchctl start ~/Library/LaunchAgents/local.brewster
#
# Verify Brewster's running
sudo launchctl list | grep local.brewster
#
# Stop running Brewster's process and unload the daemon service from launchd
sudo launchctl stop local.brewster
sudo launchctl unload ~/Library/LaunchAgents/local.brewster.plist
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
 <dict>
   <key>Label</key>
   <string>local.brewster</string>
   <key>ProgramArguments</key>
   <array>
     <string>/bin/zsh</string>
     <string>/Users/syd/Code/misc/Brewster/brewster.zsh</string>
   </array>
   <key>ServiceDescription</key>
   <string>Brewster</string>
   <key>StartCalendarInterval</key>
   <dict>
     <key>Hour</key>
     <integer>18</integer>
     <key>Minute</key>
     <integer>30</integer>
   </dict>
 </dict>
</plist>
```

### cron

```sh
# crontab
# cron runs Brewster "at 18:30:00pm every day"
sudo vi /etc/crontab
0 30 18 ? * * * root $HOME/Code/misc/Brewster/brewster.zsh
```

<!--- RESOURCES & SOURCES -->

* * *
Tags: system maintenance, homebrew, brew, crontab, cron

updated: *20201003_190407*

[1]: https://www.freeformatter.com/cron-expression-generator-quartz.html "Cron Expression Generator & Explainer"
[2]: https://codebeautify.org/xmlvalidator "XML Validator"
[3]: file:///Applications/Lingon%20X.app "Lingon"

[4]: https://medium.com/swlh/how-to-use-launchd-to-run-services-in-macos-b972ed1e352 "Use launchd to Run Services in macOS"
[5]: https://stackoverflow.com/questions/28063598/error-while-executing-plist-file-path-had-bad-ownership-permissions "Error while executing .plist file Path had bad ownership/permissions"
[6]: https://crontab.guru "cron schedule expression editor"
