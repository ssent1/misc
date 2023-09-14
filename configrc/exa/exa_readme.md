# exa/eza

# Contents

- [exa/eza](#exaeza)
- [Contents](#contents)
  - [rm exa](#rm-exa)
  - [config eza](#config-eza)
    - [Step 0. Install eza.](#step-0-install-eza)
  - [eza config file](#eza-config-file)
    - [Step 1. Argument handler](#step-1-argument-handler)
    - [Step 2. exa config file](#step-2-exa-config-file)
    - [Step 3. exa aliases](#step-3-exa-aliases)

## rm exa

```zsh
brewster
Warning: Some installed formulae are deprecated or disabled.
You should find replacements for the following formulae:
  exa

ogham/exa
exa is unmaintained, use the fork eza instead.

brew rm exa
Uninstalling /usr/local/Cellar/exa/0.10.1_2... (12 files, 985.4KB)
```

## config eza

### Step 0. Install eza.

If necessary, install eza.

```zsh
brew install eza
```

I'd like to see a config file implemented as well. In the meantime, this is my hack.

## eza config file

### Step 1. Argument handler

Add an argument handler script. Step 1 runs a script to pass `eza` the options stored in the `opts` array and any command-line arguments passed to the script. The `$@` syntax passes all command-line arguments passed to the script as separate arguments to eza.

1. Create the script:

```zsh
touch ~/.bin/eza
```

2. Add the following code:

```zsh
##!/usr/bin/env zsh
set -euo pipefail

readonly file="$HOME/.ezarc"
readonly opts=("${(f):-$(<"$file")}")

/usr/local/bin/eza "${opts[@]}" "$@"
```

3. Make it executable.

```zsh
chmod +x ~/.bin/eza
```

### Step 2. exa config file

Load default arguments into your config file.

1. Create the config file:

```zsh
touch ~/.ezarc
```

2. Add your preferred default arguments (one per line). E.g.:

```zsh
--all
--colour=always
--git
--git-ignore
--group-directories-first
--icons
--long
--time-style=iso
```

### Step 3. exa aliases

Update your `~/.zshrc` or `~/.zsh_aliases` configuration file(s)(optional). E.g.:

1. Add or update aliases. If you were using `exa`, all you need to do is change `exa` to `eza`.

```zsh
# aliases
## global aliases
alias -g ldd='eza -D --sort=mod'    # list directories, sort, descending, MODIFIED
alias -g ldn='eza -Dr'              # list directories, sort, descending, NAME
alias -g lsD='eza -r --sort=mod'    # sort, ascending, MODIFIED
alias -g lsN='eza -r'               # sort, ascending, name
alias -g lsS='eza -r --sort=size'   # sort, ascending, size
alias -g lsd='eza --sort=mod'       # sort, descending, MODIFIED
alias -g lsn='eza'                  # sort, descending, NAME
alias -g lss='eza --sort=size'      # sort, descending, SIZE
alias -g lst='eza --tree --level=2' # sort, descending, NAME && show directory tree
```

2. Save your work and source your `~/.zshrc` and/or `~/.zsh_aliases` again and you're good-to-go.

## explained

```zsh
#!/usr/bin/env
zsh set -euo pipefail # Enables strict error checking. Options:
  -e          # Exit immediately if any command fails.
  -u          # Treat unset variables as errors.
  -o pipefail # Exit with a non-zero status if any command in a pipeline fails.

readonly file="$HOME/.ezarc" # sets a read-only variable named file to the path of ~/.ezarc.

readonly opts=("${(f):-$(<"$file")}") # sets a read-only array named opts to the contents of the .ezarc file.
  (f)   # this flag tells Zsh to split the file contents into separate elements based on newline characters.
  ${:-} # this syntax provides a default value of an empty string if the .ezarc file is empty or does not exist.

/usr/local/bin/eza "${opts[@]}" "$@" # run eza with the options in:
  "${opts[@]}" # opts array; passes all elements of the array as separate arguments to eza
  "$@"         # passes all command-line arguments passed to the script as separate arguments to eza

# The @ symbol expands to all elements of an array.
```

- - -
<!-- sources -->
[1]: https://github.com/ogham/exa/ "ogham/exa: A modern replacement for ls"
[2]: https://github.com/eza-community/eza "eza-community/eza: A modern, maintained replacement for ls"
[3]: https://github.com/eza-community/eza/issues/139#issuecomment-1714885116 "Support configuration file"

Tags: config, configuration files, zsh

^ 2023-09-12T11:50:35-0400\
% 2023-09-13T00:15:01-0400
