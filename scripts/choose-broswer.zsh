#!/bin/zsh

# Alfred App v2.9 Workflow
# Choose Browser: { "Keyword": "cbr", "space": "true", "arg": "optional" }
# app = browser, arg = url

# Input > Script Filter
#
# <item ... arg="/Applications/Blisk.app,{query}" ...>
#    This is the argument passed to "Run Script". In the Script Filter, the text optionally add is passed to {query}.
#    When you action an item, $arg is passed to {query} in Run Script 
#
# <subtitle>.../@{query}</subtitle>
#    Dynamically displays text in Alfred's subtitle filed as you're typing.

cat << EOB

<?xml version="1.0"?>

<items>

  <item uid="blisk" arg="/Applications/Blisk.app,{query}" valid="YES" autocomplete="Blisk" type="file">
    <title>Blisk</title>
    <subtitle>/Applications/Blisk.app/@{query}</subtitle>
    <icon type="fileicon">/Applications/Blisk.app</icon>
  </item>

  <item uid="brave" arg="/Applications/Brave.app,{query}" valid="YES" autocomplete="Brave" type="file">
    <title>Brave</title>
    <subtitle>/Applications/Brave.app/@{query}</subtitle>
    <icon type="fileicon">/Applications/Brave.app</icon>
  </item>

  <item uid="chrome" arg="/Applications/Google Chrome.app,{query}" valid="YES" autocomplete="Google Chrome" type="file">
    <title>Chrome, Google</title>
    <subtitle>/Applications/Google Chrome.app/@{query}</subtitle>
    <icon type="fileicon">/Applications/Google Chrome.app</icon>
  </item>

  <item uid="edge" arg="/Applications/Microsoft Edge.app,{query}" valid="YES" autocomplete="Microsoft Edge" type="file">
    <title>Edge, Microsoft</title>
    <subtitle>/Applications/Microsoft Edge.app/@{query}</subtitle>
    <icon type="fileicon">/Applications/Microsoft Edge.app</icon>
  </item>

  <item uid="firefox" arg="/Applications/Firefox.app,{query}" valid="YES" autocomplete="Firefox" type="file">
    <title>Firefox</title>
    <subtitle>/Applications/Firefox.app/@{query}</subtitle>
    <icon type="fileicon">/Applications/Firefox.app</icon>
  </item>

  <item uid="opera" arg="/Applications/Opera.app,{query}" valid="YES" autocomplete="Opera" type="file">
    <title>Opera</title>
    <subtitle>/Applications/Opera.app/@{query}</subtitle>
    <icon type="fileicon">/Applications/Opera.app</icon>
  </item>

  <item uid="safari" arg="/Applications/Safari.app,{query}" valid="YES" autocomplete="Safari" type="file">
    <title>Safari</title>
    <subtitle>/Applications/Safari.app/@{query}</subtitle>
    <icon type="fileicon">/Applications/Safari.app</icon>
  </item>

  <item uid="sidekick" arg="/Applications/Sidekick.app,{query}" valid="YES" autocomplete="Sidekick" type="file">
    <title>Sidekick</title>
    <subtitle>/Applications/Sidekick.app/@{query}</subtitle>
    <icon type="fileicon">/Applications/Sidekick.app</icon>
  </item>

  <item uid="vivaldi" arg="/Applications/Vivaldi.app,{query}" valid="YES" autocomplete="Vivaldi" type="file">
    <title>Vivaldi</title>
    <subtitle>/Applications/Vivaldi.app/@{query}</subtitle>
    <icon type="fileicon">/Applications/Vivaldi.app</icon>
  </item>

</items>

EOB

# Run Script

query="{query}"

app=$(echo "$query" | sed -E 's/(.*)\@(.*)/\1/g')
url=$(echo "$query" | sed -E 's/(.*)\@(.*)/\2/g')


if [[ -n $url ]]; then
  open -a "$app:t:r" && sleep 2 && open -a "$app:t:r" "$url"
  wait for 2 seconds for browser to load, then open location
else
  open -a "$app:t:r"
fi

# test
#!/bin/zsh
#
# Actions: Run Script
# {query} < $arg; takes result from Script Filter
# N.B. Alfred passes one arg. If you need multiple vars, stuff them into $arg then parse it in actions. See sed below.
# Remove only the leading #, and the code will be properly commented so that it runs.

## query="/Applications/Blisk.app,https://pawelgrzybek.com/"
#query="/Applications/Blisk.app,"
## query="{query}"
#
# Run Test Script

# query="{query}"

# app=$(echo "$query" | sed -E 's/(.*)\@(.*)/\1/g')
# url=$(echo "$query" | sed -E 's/(.*)\@(.*)/\2/g')

# if [[ -n $url ]]; then
#   echo "$app:t:r" && sleep 2 && echo "$app:t:r" "$url"
# else
#   echo "$app:t:r"
# fi

# annotated test script
#if [[ -n $url ]]; then
## test whether there's url
## -n len(str) != 0; N.B. -z len(str) = 0
#  # open -a "$app:t:r" && sleep 2 && open -a "$app:t:r" "$url"
#  wait for 2 seconds for browser to load, then open location
#  echo "$app:t:r" && sleep 2 && echo "$app:t:r" "$url"
#else
#  # open -a "$app:t:r"
#  echo "$app:t:r"
#fi

# old
# In a previous version use osascript. The open cmd seems more reliable and it's cleaner.
# N.B. The escaped double quotes are needed for the arguments to expand. 

osascript
-e "tell application \"$app\""
-e 'activate'
-e 'end tell'
-e "open location \"$url\""

osascript -e "tell application \"$app\"" -e 'activate' -e 'end tell' -e "open location \"$url\""

# - - -
# ^ 2023-11-28T11:56:39-0500\
# % 2024-01-03T17:29:41-0500
