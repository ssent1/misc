# Open Alfred's Workflows editor: `<D-,> -> Workflows` 

# Script Filter types and examples.

cat << EOB

<?xml version="1.0"?>

<items>

  <item uid="skype" arg="/Applications/Skype.app" valid="YES" autocomplete="Skype" type="file">
    <title>Skype</title>
    <subtitle>/Applications/Skype.app</subtitle>
    <icon type="fileicon">/Applications/Skype.app</icon>
  </item>

<!--
  Example of using icon type 'fileicon' to load the file icon directly.
  This item is of type "file" which means it will be treated as a file in
  Alfred's results, so can be actioned and revealed in finder.
  Autocomplete sets what will complete when the user autocompletes.
-->

  <item uid="desktop" arg="~/Desktop" valid="YES" autocomplete="Desktop" type="file">
    <title>Desktop</title>
    <subtitle>~/Desktop</subtitle>
    <icon type="fileicon">~/Desktop</icon>
  </item>

<!--
  Example of loading an icon from the Workflow's folder.
  This item is set as valid no, which means it won't be actioned
-->

  <item uid="flickr" valid="no" autocomplete="flickr">
    <title>Flickr</title>
    <icon>flickr.png</icon>
  </item>

<!--
  Example of using icon type 'filetype' to load the icon for the file type.
  This item is of type "file" which means it will be treated as a file in
  Alfred's results, so can be actioned and revealed in finder.
-->

  <item uid="image" autocomplete="My holiday photo" type="file"> 
    <title>My holiday photo</title> 
    <subtitle>~/Pictures/My holiday photo.jpg</subtitle> 
    <icon type="filetype">public.jpeg</icon> 
  </item>

<!--
  Example of using of the new XML features from Alfred 2.3 onwards. The
  ability to define some dynamic alternative modifier subtexts as well
  as define the text used for ⌘C copying and ⌘L large type.

  Subtitle modifiers can be shift, fn, ctrl, alt, cmd and will only show
  the relevant modified output connection is made.
-->

  <item uid="home" arg="~/" valid="YES" autocomplete="Home" type="file">
    <title>Home Folder</title>
    <icon type="fileicon">~/</icon>
    <subtitle>Home folder ~/</subtitle>
    <subtitle mod="shift">Subtext when shift is pressed</subtitle>
    <subtitle mod="fn">Subtext when fn is pressed</subtitle>
    <subtitle mod="ctrl">Subtext when ctrl is pressed</subtitle>
    <subtitle mod="alt">Subtext when alt is pressed</subtitle>
    <subtitle mod="cmd">Subtext when cmd is pressed</subtitle>
    <text type="copy">Text when copying</text>
    <text type="largetype">Text for LargeType</text>
  </item>

</items>

EOB

# vim parsers for app metadata
<apps>
:s/\(\w\+\)/<item uid="\L\1" arg="\/Applications\/\1.app" valid="YES" autocomplete="\1" type="file">\r<title>\1<\/title>\r<subtitle>\/Applications\/\1.app<\/subtitle>\r<icon type="fileicon">\/Applications\/\1.app<\/icon>\r<\/item>\r/9
/Applications/Blisk.app
/Applications/Brave.app
/Applications/Firefox.app
/Applications/Google\ Chrome.app
/Applications/Google\ Chrome\ Canary.app
/Applications/Microsoft\ Edge.app
/Applications/Opera.app
/Applications/Safari.app
/Applications/Sidekick.app
/Applications/Tor\ Browser.app
/Applications/Vivaldi.app

:s/\(\w\+\)/<item uid="\l\1" arg="\/Applications\/\1.app" valid="YES" autocomplete="\1" type="file">\r<title>\1<\/title>\r<subtitle>\/Applications\/\1.app<\/subtitle>\r<icon type="fileicon">\/Applications\/\1.app<\/icon>\r<\/item>\r/7
Blisk
Brave
Firefox
Opera
Safari
Sidekick
Vivaldi

:s/^\(\%\(\w\+\\\s\)\%\(\w\+\\\s\)\?\)\(\w\+\)/<item uid="\l\2" arg="\/Applications\/\1\2.app" valid="YES" autocomplete="\1\2" type="file">\r<title>\1\2<\/title>\r<subtitle>\/Applications\/\1\2.app<\/subtitle>\r<icon type="fileicon">\/Applications\/\1\2.app<\/icon>\r<\/item>\r/3
Google\ Chrome
Google\ Chrome\ Canary
Microsoft\ Edge

:s/^\(\%\(\w\+\\\s\)\%\(\w\+\\\s\)\?\)\(\w\+\)/<item uid="\l\1" arg="\/Applications\/\1\2.app" valid="YES" autocomplete="\1\2" type="file">\r<title>\1\2<\/title>\r<subtitle>\/Applications\/\1\2.app<\/subtitle>\r<icon type="fileicon">\/Applications\/\1\2.app<\/icon>\r<\/item>\r/
Tor\ Browser

Blisk
Brave
Firefox
Google Chrome Canary
Google Chrome
Microsoft Edge
Opera
Safari
Sidekick
Tor Browser
Vivaldi
</apps>

# - - -
# <D-...> = command-key
# 
# <!-- sources -->
# [1]: https://macautomationtips.com/alfred-filter-list/ "How to Create and Use an Alfred Filter List"
# 
# Tags: :h key-notation, :h key-codes, :h keycodes
# 
# ^ 2023-11-26T19:23:35-0500\
# % 2023-11-28T12:50:18-0500
