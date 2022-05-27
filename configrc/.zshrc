# Syd Salmon's zsh configuration

export CLICOLOR=1                      # enable colourized output
export ITERM2_SQUELCH_MARK=1           # enable iTerm to add marks at prompt
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd # enable coloured `ls` commands
export PATH="/usr/local/sbin:$PATH"    # enable current zsh; not pre-installed
let base16colorspace=256               # enable 256 (8-bit RGB) colour space

# BASIC ZSH SETTINGS
HISTFILE="$HOME/.histfile"
HISTSIZE=10000
SAVEHIST=10000
ZSH_THEME="powerlevel10k/powerlevel10k"
setopt autocd extendedglob nomatch notify
setopt no_list_ambiguous
unsetopt beep

# LOAD POWERLEVEL10K
## conifg: run `p10k configure` or edit `"$HOME/.p10k.zsh"`
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    . "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f "$HOME/.p10k.zsh" ]] || . "$HOME/.p10k.zsh"

# RUN ZINIT
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" &&
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" ||
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
. "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# GET EXTERNAL RESOURCES
## source alias list
if [ -e "$HOME/.zsh_aliases" ]; then
    . "$HOME/.zsh_aliases"
fi

## run functions
if [ -e "$HOME/.zsh_functions" ]; then
    . "$HOME/.zsh_functions"
fi

## load plugins
if [ -e "$HOME/.zsh_plugins" ]; then
    . "$HOME/.zsh_plugins"
fi

# RUN ZSH COMPLETIONS
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# LOAD ZSH UTILITIES
autoload -Uz zcalc
autoload -Uz zmv

# ENABLE CUSTOM KEY BINDINGS
bindkey -M emacs " " globalias         # <Space> expands all aliases
bindkey -M viins " " globalias         # <Space> expands all aliases
bindkey -M emacs "^ " magic-space      # <C-Space> => normal space
bindkey -M viins "^ " magic-space      # <C-Space> => normal space
bindkey -M isearch " " magic-space     # normal space during searches
bindkey -M vicmd "y" yank-to-clipboard # yank to system clipboard
bindkey -v                             # vi mode

# RUN EXECUTABLES
. "$HOME/powerlevel10k/powerlevel10k.zsh-theme"
. "$HOME/.iterm2_shell_integration.zsh"
brewsterf
printf "\033c\n";meteo # show weather report
# show 10 most recently modified files
builtin cd "$HOME/Dropbox/nvalt-repo";lsd|grep --color=never --invert-match "dr.*"|tail -10 ; printf "\n"

# SOURCE 'SPECTACULA' ZSH-SYNTAX-HIGHLIGHTING
# ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets cursor line main pattern regexp root)
# typeset -gA ZSH_HIGHLIGHT_STYLES
if [ -e "$HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    . "$HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
