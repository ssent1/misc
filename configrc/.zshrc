#
# Syd Salmon's zsh configuration
#
export PATH="/usr/local/sbin:$PATH"    # enable current zsh; not pre-installed
export CLICOLOR=1                      # enable colourized output
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd # enable coloured `ls` commands
let base16colorspace=256               # enable 256 (8-bit RGB) colour space
export ITERM2_SQUELCH_MARK=1           # enable iTerm to add marks at prompt

# run powerlevel10k
## conifg: run `p10k configure` or edit `"$HOME/.p10k.zsh"`
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"

# basic zsh settings
HISTFILE="$HOME/.histfile"
HISTSIZE=10000
SAVEHIST=10000
ZSH_THEME="powerlevel10k/powerlevel10k"
setopt autocd extendedglob nomatch notify
setopt no_list_ambiguous
unsetopt beep

# zsh completions settings
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# run zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" &&
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" ||
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## source plugins
if [ -e "$HOME/.zsh_plugins" ]; then
    source "$HOME/.zsh_plugins"
fi

# load zsh utilities
autoload -Uz zcalc

# config: key bindings
bindkey -v # enable vi mode
bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches
bindkey -M vicmd 'y' vi-yank-xclip # yank to the system clipboard

# source alias list
if [ -e "$HOME/.zsh_aliases" ]; then
    source "$HOME/.zsh_aliases"
fi

# source functions
if [ -e "$HOME/.zsh_functions" ]; then
    source "$HOME/.zsh_functions"
fi

# colourize manpages (ANSI 8-bit, 256)
man() {
    LESS_TERMCAP_mb=$'\e[39;5;183m' \
    LESS_TERMCAP_md=$'\e[38;5;183m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[37;1;231;48;5;060m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_mb=$'\e[38;5;120' \
command man "$@"
}

# https-server
https-server() {
http-server --ssl --cert ~/.localhost-ssl/localhost.crt --key ~/.localhost-ssl/localhost.key
}

# run executables
source "$HOME/powerlevel10k/powerlevel10k.zsh-theme"
source "$HOME/.iterm2_shell_integration.zsh"
brewsterf
printf "\033c\n";meteo # show weather report
builtin cd "$HOME/Dropbox/nvalt-repo";lsd|grep --color=never --invert-match "dr.*"|tail -10 ; printf "\n"
# show 10 most recently modified files

# source 'Spectacula' zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets cursor line main pattern regexp root)
typeset -gA ZSH_HIGHLIGHT_STYLES

if [ -e "$HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

