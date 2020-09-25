#!/bin/zsh
set -eu -o pipefail
if [[ $(defaults -currentHost read ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb) -eq 0 ]];
  then
    defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean true
    defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturbDate -date "`date -u +\"%Y-%m-%d %H:%M:%S +000\"`"
    killall NotificationCenter
    echo "Silenzio is enabled. Run $0 to turn it off."
else
    defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean false
    killall NotificationCenter
    echo "Silenzio is disabled. Run $0 to turn it on."
fi

