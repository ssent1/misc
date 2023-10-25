#!/bin/zsh
# |> in production <|
IFS=$'\n'
match=($(grep -i {query} codes.txt))
echo '<?xml version="1.0"?>'
echo -e '<items>\n'
if [[ -n "$match" ]] ; then
        for i in ${match[@]}; do
                npac=($(echo "$i" | cut -d\: -f1))
                city=($(echo "$i" | cut -d\: -f2))
                echo "<item arg=\"$npac\" valid=\"yes\">"
                echo "<title>Area code $npac => $city</title>"
                echo "<subtitle>Press Enter for more details</subtitle>"
                echo -e "<icon>ac.png</icon></item>\n"
        done
else
        echo "<item arg=\"{query}\" valid=\"yes\">"
        echo "<title>Area code {query} => NOT FOUND</title>"
        echo "<subtitle>Go to https://www.allareacodes.com/{query} for more info.</subtitle>"
        echo -e "<icon>ac.png</icon></item>\n"
fi
echo "</items>"

# - - -
# ^ 2023-10-25T00:17:03-0400\
# % 2023-10-25T00:22:31-0400
