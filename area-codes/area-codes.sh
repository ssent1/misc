#!/bin/zsh
# |> Why doesn't this work in Alfred <|
#
#query={query}
query=519
var=$query
if [[ ${lines[(i)$pat]} -le ${#lines} ]]; then typeset -a lines=("${(f)"$(<codes.txt)"}")
	echo '<?xml version="1.0"?>'
	echo -e "<items>\n"
	if [[ ${lines[*]} =~ $var ]]; then
		for pat in "*{query}*"; do
			if [[ ${lines[(i)$pat]} -le ${#lines} ]]; then
				npac=$(echo "${lines[(r)$pat]}" | cut -d\: -f1)
				city=$(echo "${lines[(r)$pat]}" | cut -d\: -f2)
				echo "<item arg=$npac valid=\"yes\">"
				echo "<title>Area code $npac: $city</title>"
				echo "<subtitle>Press Enter for more details</subtitle>"
				echo -e "<icon>ac.png</icon></item>\n"
			else
				echo "<title>Area code $var not found.</title>"
				echo "<subtitle> [[ ! -e area code ]] && Enter valid area code || Add $var to database</subtitle>"
				echo "<icon>ac.png</icon></item>"
				echo -e "<icon>ac.png</icon></item>\n"
			fi
		done
	fi
	echo "</items>"
fi

# test condition for manual cli execution

if [[ $? -ne 0 ]]; then
	echo "query = ${query}\nvar = ${var}\n{#lines} = ${#lines}\npat = ${pat}\nnpac = ${npac}\ncity = ${city}\n" | \
		column -t
		else
			echo "Success: yay!!"
			unset query var lines pat npac city 
fi

# ---
# [1]: https://www.allareacodes.com/519 "519 Area Code"
# [2]: https://www.gobankingrates.com/money/financial-planning/list-of-scammer-phone-numbers/ "Scam Phone Numbers"

#!/bin/zsh
# |> in production <|
# runs manually from cli

query=519
var=$query

IFS=$'\n' 
match=($(grep -i {query} codes.txt))
echo '<?xml version="1.0"?>'
echo -e '<items>\n'
for i in ${match[@]}; do
	npac=($(echo "$i" | cut -d\: -f1))
	city=($(echo "$i" | cut -d\: -f2))
	echo "<item arg=\"$npac\" valid=\"yes\">"
	echo "<title>Area code $npac => $city</title>"
	echo "<subtitle>Press Enter for more details</subtitle>"
	echo -e "<icon>ac.png</icon></item>\n"
done
echo "</items>"

# - - -

#!/bin/zsh
# |> in production <|

IFS=$'\n' 
match=($(grep -i {query} codes.txt))
echo '<?xml version="1.0"?>'
echo -e '<items>\n'

if [[ "$match" != 0 ]] ; then
	for i in ${match[@]}; do
		npac=($(echo "$i" | cut -d\: -f1))
		city=($(echo "$i" | cut -d\: -f2))
		echo "<item arg=\"$npac\" valid=\"yes\">"
		echo "<title>Area code $npac => $city</title>"
		echo "<subtitle>Press Enter for more details</subtitle>"
		echo -e "<icon>ac.png</icon></item>\n"
	done
else
	echo "<item arg=\"not found\" valid=\"yes\">"
	echo "<title>Area code "$npac" => NOT FOUND</title>"
	echo "<subtitle>Go to https://www.allareacodes.com/"$npac" for more info.</subtitle>"
	echo -e "<icon>ac.png</icon></item>\n"
fi
	echo "</items>"

# ---

#!/bin/zsh
# |> in production <|
# runs manually from cli

query=999
var=$query

IFS=$'\n' 
match=($(grep -i {query} codes.txt))
echo '<?xml version="1.0"?>'
echo -e '<items>\n'

if [[ "$match" != 0 ]] ; then
	for i in ${match[@]}; do
		npac=($(echo "$i" | cut -d\: -f1))
		city=($(echo "$i" | cut -d\: -f2))
		echo "<item arg=\"$npac\" valid=\"yes\">"
		echo "<title>Area code $npac => $city</title>"
		echo "<subtitle>Press Enter for more details</subtitle>"
		echo -e "<icon>ac.png</icon></item>\n"
	done
else
	echo "<item arg=\"$var\" valid=\"yes\">"
	echo "<title>Area code $var => NOT FOUND</title>"
	echo "<subtitle>Go to https://www.allareacodes.com/$var for more info.</subtitle>"
	echo -e "<icon>ac.png</icon></item>\n"
fi
echo "</items>"


query=519
var=$query

IFS=$'\n' 
match=($(grep -i {query} codes.txt))
echo '<?xml version="1.0"?>'
echo -e '<items>\n'

if [[ "$match" != 0 ]] ; then
	for i in ${match[@]}; do
		npac=($(echo "$i" | cut -d\: -f1))
		city=($(echo "$i" | cut -d\: -f2))
		echo "<item arg=\"$npac\" valid=\"yes\">"
		echo "<title>Area code $npac => $city</title>"
		echo "<subtitle>Press Enter for more details</subtitle>"
		echo -e "<icon>ac.png</icon></item>\n"
	done
else
	echo "<item arg=\"not found\" valid=\"yes\">"
	echo "<title>Area code "$npac" => NOT FOUND</title>"
	echo "<subtitle>Go to https://www.allareacodes.com/"$npac" for more info.</subtitle>"
	echo -e "<icon>ac.png</icon></item>\n"
fi
echo "</items>"

# - - -
query=999
var=$query

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
        echo "<item arg=\"$var\" valid=\"yes\">"
        echo "<title>Area code $var => NOT FOUND</title>"
        echo "<subtitle>Go to https://www.allareacodes.com/$var for more info.</subtitle>"
        echo -e "<icon>ac.png</icon></item>\n"
fi
echo "</items>"

<?xml version="1.0"?>
<items>

<item arg="999" valid="yes">
<title>Area code 999 => NOT FOUND</title>
<subtitle>Go to https://www.allareacodes.com/999 for more info.</subtitle>
<icon>ac.png</icon></item>

</items> query=519
var=$query

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
        echo "<item arg=\"$var\" valid=\"yes\">"
        echo "<title>Area code $var => NOT FOUND</title>"
        echo "<subtitle>Go to https://www.allareacodes.com/$var for more info.</subtitle>"
        echo -e "<icon>ac.png</icon></item>\n"
fi
echo "</items>"

<?xml version="1.0"?>
<items>

<item arg="519" valid="yes">
<title>Area code 519 => Kitchener-Waterloo, ON</title>
<subtitle>Press Enter for more details</subtitle>
<icon>ac.png</icon></item>

</items>

# - - -

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
