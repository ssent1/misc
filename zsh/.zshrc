export PATH="/usr/local/sbin:$PATH"
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /Users/syd/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
unsetopt beep
setopt no_list_ambiguous
bindkey -e
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
bindkey -v # use vi-style key bindings
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/syd/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node \
    agkozak/zsh-z

### End of Zinit's installer chunk

zinit ice depth=1; zinit light romkatv/powerlevel10k
source ~/powerlevel10k/powerlevel10k.zsh-theme

autoload zmv
# ZSH_THEME="agnoster"
ZSH_THEME="spaceship"

# Aliases
# https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
alias -g l='&& ls -aFGhort'
alias -s md='subl'
alias .='echo $PWD'
alias ..='cd ..'
alias ...='cd ../../../'
alias bc='bc -l'
alias bi='brew install'
alias brewster='zsh /Users/syd/Code/misc/Brewster/brewster.zsh'
alias cd..='cd ..'
alias cdl='cd l'
alias cls='clear'
alias diff='colordiff'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gitp='git push && git status'
alias gits='git status'
alias grep='grep --color=auto'
alias h='history'
alias j='jobs -l'
alias ls='ls -alG'
alias lsd='ls -aFGhort'
alias lsn='ls -aFGhor'
alias meteo='bash /Users/syd/Code/meteo/meteo.sh'
alias mic='micro'
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias ping='ping -c10 1.1.1.1'
alias rm='rm -Rfd'
alias wttr='curl https://wttr.in/YKF\?F --silent --max-time 3'
alias zcp='zmv -C'
alias zln='zmv -L'
#
# Start privileged access
if [[ $UID -ne 0 ]]; then
  alias dgk='sudo spctl --master-disable # disable Gatekeeper'
  alias egk='sudo spctl --master-enable # enable Gatekeeper'
  alias rms='sudo rm -Rfd'
  alias sd='sudo shutdown -h +1 - "The system is ★==> shutting down <==★ in one (1) minute."'
  alias sr='sudo shutdown -r now - "The system is ★==> rebooting <==★ now!"'
  alias top='sudo htop -s PERCENT_MEM'
  alias vis='sudo vi'
fi
# End privileged access
#
function https-server() { http-server --ssl --cert ~/.localhost-ssl/localhost.crt --key ~/.localhost-ssl/localhost.key }
