# Syd Salmon's zsh configuration @nollij (iMac)

export PATH="/usr/local/sbin:$PATH"              # enable zsh 5.9 (x86_64-apple-darwin20.6.0); default: zsh 5.8 (x86_64-apple-darwin20.0) @ /bin/zsh
export PATH="/usr/local/opt/openssl@3/bin:$PATH" # enable openssl@3; default: LibreSSL 2.8.3 @ /usr/bin/openssl
export CLICOLOR_FORCE=1                          # enable colourized output; NB: CLICOLOR=1 does not pipe colour
export ITERM2_SQUELCH_MARK=1                     # enable iTerm to add marks at prompt
export LESS=" -R  -X -F "                        # https://ole.michelsen.dk/blog/syntax-highlight-files-macos-terminal-less/
export LESSOPEN="| src-hilite-lesspipe.sh %s"    #
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcad           # enable coloured ls commands
export RIPGREP_CONFIG_PATH=~/.ripgreprc          # path to ripgrep config
export ZSH=~/.oh-my-zsh                          # path to oh-my-zsh
let base16colorspace=256                         # enable 256 (8-bit RGB) colour space

# BASIC ZSH SETTINGS
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
ZSH_THEME="powerlevel10k/powerlevel10k"
setopt autocd extendedglob nomatch notify
# NB: for ad hoc case-insensitive globbing (#i): ls (#i)*abc* OR ls|grep -i abc
setopt no_list_ambiguous
unsetopt beep

# LOAD POWERLEVEL10K
## conifg: run "p10k configure" or edit "~/.p10k.zsh"
[[ -x ~/.p10k.zsh ]] && . ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# RUN ZINIT
# Source zinit.zsh if it exists, otherwise install zinit
if [[ -e ~/.zinit/bin/zinit.zsh ]]; then
    source ~/.zinit/bin/zinit.zsh
else
echo "\033[33m▓▒░ \033[38;5;220mInstalling \033[33mDHARMA\033[38;5;220m Plugin Manager (\033[33mzdharma-continuum/zinit\033[38;5;220m)…\033[0m"
    mkdir -p ~/.zinit && chmod go-rwX ~/.zinit
    git clone https://github.com/zdharma-continuum/zinit ~/.zinit/bin &&
echo "\033[33m▓▒░ \033[34mInstallation successful.\033[0m\033[1m\033[0m" &&
    source ~/.zinit/bin/zinit.zsh ||
    echo "\033[160m▓▒░ Clone failed. Try running:\n\033[15m/bin/rm -Rfd ~/.zinit/bin\n\033[0m\033[1m\033[0m"
fi

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
autoload -U compinit -d "~/.cache/zsh/zcompdump-$ZSH_VERSION"

# RUN ZSH COMPLETIONS
zstyle :compinstall filename ~/.zshrc
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

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

# Source/EXecute Zsh configuration files
sex() {
    local file="$1"
    if [[ -e "$file" ]]; then
        source "$file"
        else
        echo "$file was NOT sourced."
    fi
}

sex ~/.zsh_aliases
sex ~/.zsh_functions
sex ~/.zsh_plugins
sex ~/.oh-my-zsh/custom/themes/powerlevel10k
sex ~/.iterm2_shell_integration.zsh

brewsterf
# tput reset && . ~/Code/meteo/meteo # show weather report
cl ~/Dropbox/nvalt # cd to nvalt, show 10 most recently modified files
# builtin cd "~/Dropbox/nvalt";lsd|grep --color=never --invert-match "dr.*"|tail -10 ; printf "\n"

# SOURCE 'SPECTACULA' ZSH-SYNTAX-HIGHLIGHTING
# ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets cursor line main pattern regexp root)
# typeset -gA ZSH_HIGHLIGHT_STYLES
# if [ -e "/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
#     . "/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# fi

# notes & references

## ^ 2022-01-12T21:16:44-0500
## % 2023-05-15T16:38:08-0400