# [.DS_Store, .AppleDouble, etc][2]

> .DS_Store files are created by OS X to store metadata about folders and files including viewing options, icon positions and color labels. ._ AppleDouble files are created by the OS X when an application adds resource data or metadata to a file on a disk whose format doesn't support resources or metadata.

## [DESKTOP SERVICES STORE FILES][3]

`.DS_Store`. ≡ `Finder` preferences

* Finder’s window config
* view mode (icon, list, columns, CoverFlow)
* icon positions
* sort preferences
* background images
* etc.
  
Finder's view preferences are either set indirectly or explicitly. When a `.DS_Store` file is removed, its folder reverts to the default view settings. Finder creates a new `.DS_Store` each time it's used.

## [dot underscore `._`][3]

`._` (dot underscore) ≡ stores Mac-specific attributes for file systems that do not have native support for the Darwin kernel

* type codes
* visibility markers
* quarantine info
* resource forks

These file are used when it is necessary to emulate these attributes on foreign file systems.

* storing a classic Mac app onto an MS-DOS disk
* rarely found on HFS+ disks

## [PURGING RESOURCE DATA &/or METADATA][2]

1. _Can data loss occur?_  
**Yes**. Some applications rely on data stored in `._` files (e.g. legacy MacOS fonts or _EPS files_) or other metadata files.

## [SEEK &/or DESTROY RESOURCE DATA/METADATA][5]

```sh
# find & verify all files before purging
#! /bin/zsh
mkdir $HOME/Code/misc/Purgify
touch $HOME/Code/misc/Purgify/purgify.zsh
cat << EOF > $HOME/Code/misc/Purgify/purgify.zsh
sudo find / -name ".DS_Store"       > $HOME/Downloads/app_purge/Purgify/DS_Store        2> /dev/null
sudo find / -name ".apdisk"         > $HOME/Downloads/app_purge/Purgify/apdisk          2> /dev/null
sudo find / -name ".AppleDouble"    > $HOME/Downloads/app_purge/Purgify/AppleDouble     2> /dev/null
sudo find / -name ".AppleDB"        > $HOME/Downloads/app_purge/Purgify/AppleDB         2> /dev/null
sudo find / -name "afpd.core"       > $HOME/Downloads/app_purge/Purgify/afpd_core       2> /dev/null
sudo find / -name ".TemporaryItems" > $HOME/Downloads/app_purge/Purgify/TemporaryItems  2> /dev/null
sudo find / -name "__MACOSX"        > $HOME/Downloads/app_purge/Purgify/MACOSX          2> /dev/null
sudo find / -name "._*"             > $HOME/Downloads/app_purge/Purgify/dot_star        2> /dev/null
EOF
chmod a+x $HOME/Code/misc/Purgify/purgify.zsh
# ~~~END OF SCRIPT
#
# Run Script Find
./purgify.zsh                                    # runs script
sudo vi /etc/crontab                             # automate removal
@hourly root $HOME/Code/misc/Purgify/purgify.zsh # cron run the script hourly
#
#! /bin/zsh
# ★==> EXEXCUTABLE <==★
#
mkdir $HOME/Code/misc/Purgify
touch $HOME/Code/misc/Purgify/purgify.zsh
cat << EOF > $HOME/Code/misc/Purgify/purgify.zsh
find / -name ".DS_Store"        -exec rm -Rf {} \;
find / -name ".apdisk"          -exec rm -Rf {} \;
find / -name ".AppleDouble"     -exec rm -Rf {} \;
find / -name ".AppleDB"         -exec rm -Rf {} \;
find / -name "afpd.core"        -exec rm -Rf {} \;
find / -name ".TemporaryItems"  -exec rm -Rf {} \;
find / -name "__MACOSX"         -exec rm -Rf {} \;
find / -name "._*"              -exec rm -Rf {} \;
EOF
```

### RESULTS ==> SEEK &/or DESTROY

* DS_Store       = 990 ==> `Purgify!` 
    `sudo find / -name ".DS_Store" -exec rm -Rf {} \; 2> /dev/null`
                 = 0
* apdisk         = 0
* AppleDouble    = 0
* AppleDB        = 0
* afpd_core      = 0
* TemporaryItems = 0
* MACOSX         = 5
  * 3 × `/Users/syd/unsaved/2019/2019-11/LG\ G4*`
  * 2 × `/Users/syd/Library/Application Support/Sublime Text 3/`
* dot_star       = 289 ==> applications extensions (no action required)

## [CANDIDATES FOR DELETION][2]

Delete?

* [/] ._AppleDouble
* [/] .apdisk
* [x] .DS_Store
* [/] .VolumeIcon.icns
*
* [/] .fseventsd (disks only)
* [/] .Spotlight-V100 (disks only, not running 10.14 Mojave)
* [/] .TemporaryItems (disks only)
* [/] .Trashes (disks only)
*
* [/] .AppleDouble folders (NAS/*NIX)
* [/] Files which match a UNIX wildcard string e.g "*.blah"
*
* [/] $Recycle.bin (from Windows)
* [/] Desktop.ini (from Windows)
* [/] Thumbs.ini (from Windows)

## [PREVENTING .DS_STORE &/or .APPLEDOUBLE ON NETWORK DRIVES][5]

```s
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# ??
❯ defaults read com.apple.desktopservices
2020-10-02 17:46:15.644 defaults[4782:171376]
Domain com.apple.desktopservices does not exist
```

<!--- RESOURCES & SOURCES -->

* * *
Tags: .DS_Store, .AppleDouble, .apdisk, macOS metadata, clean, purge, prune, system maintenance, hidden macOS support files

updated: *20201002_175601*

[1]: http://techdatadigest.blogspot.com/2018/04/find-and-remove-appledouble-after.html "Find and remove .AppleDouble"
[2]: http://www.zeroonetwenty.com/blueharvest/frequently-asked-questions.html "What is a .DS_Store or ._ AppleDouble file?"
[3]: https://www.bresink.com/osx/300644207/Docs-en/pgs/0130-CleanUp.html "Hidden Support Files"
[4]: https://geraldonit.com/2020/02/08/apple-afp-to-smb-migration-removing-appledouble-and-_-files-and-converting-file-names-from-unicode-nfd-to-nfc/
[5]: https://mycyberuniverse.com/mac-os/find-and-remove-ds_store-and-appledouble.html "Find and remove .DS_Store and .AppleDouble"
[6]: https://github.com/simsalabim/dsweeper "sweeper - AppleDouble files sweeper"
[7]: https://ss64.com/osx/dot_clean.html "dot_clean"
[8]: https://support.apple.com/en-ca/HT202021
[9]: https://www.codegrepper.com/code-examples/shell/linux+delete+appledouble+ds_store+files
