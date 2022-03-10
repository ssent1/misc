#d/bin/zsh
{
    # update Homebrew
    brew upgrade
    brew update
    brew cleanup
    brew doctor

    # update npm - javascript package manager
    npm update
    npm prune

    # python3 pip
    # python3 -m pip
    # pip 22.0.4 from /usr/local/lib/python3.9/site-packages/pip (python 3.9)
    # build update list
    src="$HOME/Code/misc/Brewster/pip-squeak"
    python3 -m pip list | awk '(NR <=2) {next} /^([a-zA-Z0-9]+).*/ {print "python3 -m pip install -U " $1}' >"$src"
    sleep 2
    while IFS= read -r line; do printf '%s\n' "$line"; done <"$src"

} 2>/dev/null
