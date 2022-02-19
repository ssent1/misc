#
# Syd Salmon's zsh configuration
#
export PATH="/usr/local/sbin:$PATH"     # enable current zsh; not pre-installed
export CLICOLOR=1                       # enable colourized output
export ITERM2_SQUELCH_MARK=1            # enable iTerm to add marks at prompt
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd  # enable coloured `ls` commands
let base16colorspace=256                # enable 256 (24-bit RGB) colour space

# <powerlevel10k>
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# </powerlevel10k>

# <instant_prompt>
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

man() {
  LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;37m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
## `p10k configure` or edit `~/.p10k.zsh`
# </instant_prompt>

# <zsh_installer>
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
ZSH_THEME="powerlevel10k/powerlevel10k"
setopt autocd extendedglob nomatch notify
setopt no_list_ambiguous
unsetopt beep
# </zsh_installer>

# <zsh_completions>
zstyle :compinstall filename '/Users/syd/.zshrc'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# </zsh_completions>

# <zinit>
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

## <plugins>
if [ -e $HOME/.zsh_plugins ]; then
  source $HOME/.zsh_plugins
fi
## </plugins>
# </zinit>

# <zsh_utilities>
autoload -Uz zcalc
# </zsh_utilities>

# <key_bindings>
bindkey -e  # enable Emacs mode
bindkey " " globalias
bindkey "^ " magic-space            # control-space to bypass completion
bindkey -M isearch " " magic-space  # normal space during searches
# </key_bindings>

# <aliases>
if [ -e $HOME/.zsh_aliases ]; then
  source $HOME/.zsh_aliases
fi
# </aliases>

# <cd++>
if [ -e $HOME/.zsh_functions ]; then
    source $HOME/.zsh_functions
fi
# </cd++>

# <executables>
source ~/powerlevel10k/powerlevel10k.zsh-theme
brewsterf # show prompt to run Brewster
printf "\033c\n" ; meteo
builtin cd /Users/syd/Dropbox/nvalt_repo ; lsd | grep --invert-match "dr.*" | tail -10 ; printf "\n"
function https-server() { http-server --ssl --cert ~/.localhost-ssl/localhost.crt --key ~/.localhost-ssl/localhost.key }
source ~/.iterm2_shell_integration.zsh
zle -N globalias  # enable automatic global alias expansion
# </executables>
