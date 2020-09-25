# Silenzio-- Toggle Apple "Do Not Disturb" Notifications

> Silenzio enables/disables macOS "Do Not Disturb" from the Zsh shell

## ★==> Toggle Notifications <==★

```zsh
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

# [Enable/disable "Do Not Disturb" from the shell](https://apple.stackexchange.com/a/303400/375546)
# [Enabling Do Not Disturb mode](https://heyfocus.com/blog/enabling-do-not-disturb-mode/)
```

## Implement Silenzio via `launchd` or `crontab`

| Folder                        | Use                                 |
|:------------------------------|:------------------------------------|
| /System/Library/LaunchDaemons |  system daemons                    |
| /System/Library/LaunchAgents  |  agents, ∀ users, per-user         |
| /Library/LaunchDaemons        | Third-party system daemons          |
| /Library/LaunchAgents         | 3rd-party agents, ∀ users, per-user |
| ~/Library/LaunchAgents        | 3rd-party agents, logged-in user    |

1. Go to `$HOME/Library/LaunchAgents`uf

### Cron Expression

- `0 0 8-18 ? * * *`   > Run every hour between hour `08` and hour `18`
- `0 0 8/3 ? * * *`    > Run every `3` hour(s) starting at hour `08`
- ★==> `0 0 8-18/3 ? * * *` > Run every `3` hour(s) between hour `08` and hour `18` <==★

Data for launchd expression.

```shell
com.proganica.silenzio_0
zsh
-c
/Users/syd/Code/misc/Silenzio/silenzio.zsh
Disable  Do Not Disturb. `0 0 8-18/3 ? * * *` ≡ runs @sec:00, @min:00, every 3 hours between hours 08am and 18pm, of every day.
```

<!--- RESOURCES & SOURCES -->

* * *
Tags: do not disturb, automation, productivity

updated: *20200922_113238*

[1]: https://support.apple.com/lt-lt/guide/terminal/apdc6c1077b-5d5d-4d35-9c19-60f2397b2369/mac "launchd - script management"
[2]: https://www.pantz.org/software/cron/croninfo.html "Cron and Crontab"
[3]: https://alvinalexander.com/mac-os-x/mac-osx-startup-crontab-launchd-jobs/ "Mac crontab: Creating MacOS startup jobs with crontab, er, launchd | alvinalexander.com"
[4]: https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html "Creating Launch Daemons and Agents"
[5]: https://www.launchd.info/ "A launchd Tutorial"
[6]: https://medium.com/swlh/how-to-use-launchd-to-run-services-in-macos-b972ed1e352 "How to Use launchd to Run Services in macOS | by Kosala Sananthana | The Startup | Medium"
[7]: https://robservatory.com/goodbye-cron-task-hello-launchd-agent/ "Goodbye cron task, hello launchd agent | The Robservatory"
[8]: https://codedmemes.com/lib/replacing-cron-jobs-with-launchd/ "Replacing Cron Jobs With Launchd on OS X"
[9]: https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/ScheduledJobs.html "Scheduling Timed Jobs"
[10]: https://blog.jan-ahrens.eu/2017/01/13/cron-is-dead-long-live-launchd.html#:~:text=launchd%20does%20a%20lot%20more,launchd%20distincts%20daemons%20and%20agents. "cron is dead, long live launchd! - Selected Thoughts"
[11]: http://www.paullegato.com/blog/launchctl-cron/ "Launchctl vs Cron: You’ve Got To Be Kidding Me | Paul Legato"
[12]: https://www.freeformatter.com/cron-expression-generator-quartz.html "Cron Expression Generator and Describer"
