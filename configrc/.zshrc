# Syd Salmon's zsh configuration @nollij (iMac)

export PATH="/usr/local/opt/openssl@3/bin:$PATH" # enable openssl@3; default: LibreSSL 2.8.3 @ /usr/bin/openssl
export PATH="/usr/local/sbin:$HOME/.bin:$PATH"   # enable zsh 5.9; default: zsh 5.8 @ /bin/zsh
export CLICOLOR_FORCE=1                          # enable colourized output; NB: CLICOLOR=1 does not pipe colour
export HOMEBREW_NO_ENV_HINTS=1
export ITERM2_SQUELCH_MARK=1                     # enable iTerm to add marks at prompt
export LESS=' -R -X -F '
export LESSOPEN="| ${LESSPIPE} %s"
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcad           # enable coloured ls commands
export RIPGREP_CONFIG_PATH=~/.ripgreprc          # path to ripgrep config
export ZSH=~/.oh-my-zsh                          # path to oh-my-zsh
LESSPIPE=$(which src-hilite-lesspipe.sh)
let base16colorspace=256                         # enable 256 (8-bit RGB) colour space
# Syntax highlighting with less https://ole.michelsen.dk/blog/syntax-highlight-files-macos-terminal-less/

# BASIC ZSH SETTINGS
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
ZSH_THEME="powerlevel10k/powerlevel10k"
setopt autocd extended_glob nomatch notify
# NB: for ad hoc case-insensitive globbing (#i): ls (#i)*abc* OR ls|grep -i abc
setopt no_list_ambiguous
unsetopt beep

# SOURCE/EXECUTE ZSH CONFIGURATION FILES
sex() {
    local file="$1"
    if [[ -e "$file" ]]; then
        source "$file"
        else
        echo "$file was NOT sourced."
    fi }

sex "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
sex ~/.fzf.zsh
sex ~/.iterm2_shell_integration.zsh
sex ~/.oh-my-zsh/custom/themes/powerlevel10k
sex ~/.oh-my-zsh/oh-my-zsh.sh
sex ~/.p10k.zsh
sex ~/.zinit/bin/zinit.zsh
sex ~/.zsh_aliases
sex ~/.zsh_functions
sex ~/.zsh_functions_dir/dictionary.zsh
sex ~/.zsh_plugins
sex ~/Code/misc/scripts/gas/get-gas-price.zsh
sex ~/Code/misc/scripts/gas/log-gas-price.zsh

# When using instant prompt, Powerlevel10k must be loaded before the first prompt.
# If necessary, "p10k configure" or edit "~/.p10k.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
autoload -U compinit -d "~/.cache/zsh/zcompdump-$ZSH_VERSION"

brewsterf # run package manager {homebrew, npm} updates

# RUN ZSH COMPLETIONS
zstyle :compinstall filename ~/.zshrc
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
eval $(thefuck --alias) # corrects erroneous commands

# LOAD ZSH UTILITIES
autoload -Uz zcalc
autoload -Uz zmv
autoload -U select-word-style; select-word-style bash # backward-kill-word stops at / in paths

# ENABLE CUSTOM KEY BINDINGS
bindkey -M emacs " " globalias         # <Space> expands all aliases
bindkey -M viins " " globalias         # <Space> expands all aliases
bindkey -M emacs "^ " magic-space      # <C-Space> => normal space
bindkey -M viins "^ " magic-space      # <C-Space> => normal space
bindkey -M isearch " " magic-space     # normal space during searches
bindkey -M vicmd "y" yank-to-clipboard # yank to system clipboard
bindkey -v                             # vi mode

# SETUP WORKSPACE
# show weather report; cd to nvalt, show 10 most recently modified files
if [[ ! -x ~/Code/meteo/meteo_f ]]; then
    printf "\033[34mmeteo:\033[0m \033[31mnot found\033[0m\n"
else
    tput reset && source ~/Code/meteo/meteo_f && meteo
fi
print_gas_price && printf "\n"
log_gas_price
cd ~/Dropbox/nvalt && lsd | tail -n 10 && printf "\n"

## ^ 2022-01-12T21:16:44-0500\
## % 2025-01-18T16:37:46-0500

# Added by Windsurf
export PATH="/Users/syd/.codeium/windsurf/bin:$PATH"
