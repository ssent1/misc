#
# Syd Salmon's Zsh Configuration
#
export PATH="/usr/local/sbin:$PATH"
export CLICOLOR=1
export ITERM2_SQUELCH_MARK=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
let base16colorspace=256 # use 256 colorspace

# <Powerlevel10k>
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# </Powerlevel10k>

# <Instant Prompt Customization>
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
# </Instant Prompt Customization>

# <Zsh installer>
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
ZSH_THEME="powerlevel10k/powerlevel10k"
bindkey "[C" forward-word
bindkey "[D" backward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
bindkey -v # Vi mode for Zsh line editing (zle); `-e` = Emacs mode  
setopt autocd extendedglob nomatch notify
setopt no_list_ambiguous
unsetopt beep
# </Zsh installer>

# <Zsh completions>
zstyle :compinstall filename '/Users/syd/.zshrc'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# </Zsh completions>

# <Zinit>
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

## <Zinit annexes, without Turbo>
zinit light-mode for \
    agkozak/zsh-z \
    zdharma/fast-syntax-highlighting \
    zdharma/history-search-multi-word \
    jeffreytse/zsh-vi-mode \
    romkatv/powerlevel10k \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node \
    zinit-zsh/z-a-patch-dl \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions
## </Zinit annexes>
# </Zinit>

# <Autoload>
autoload -Uz compinit && compinit
autoload -Uz zmv
# </Autoload>

# <Executables>
function https-server() { http-server --ssl --cert ~/.localhost-ssl/localhost.crt --key ~/.localhost-ssl/localhost.key }
meteo
source /usr/local/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.iterm2_shell_integration.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
# </Executables>

# <Aliases>
alias -g l='&& ls -aFGhort' # global: e.g. `cd l` after `cd` to `ls` after `cd` runs
alias -g nv='/Users/syd/Dropbox/nvalt_repo'
alias -g t='; printf "\033c\n" ; lsd | grep --invert-match "dr.*" | tail -10' # cls, show top 10
alias -s md='code' # suffix alias: launch Markdown files (.md) in Visual Studio Code 
alias ...='cd ../../../' # cd up three levels
alias ..='cd ..' # cd up one level
alias .='print $PWD' # print working directory
alias bc='bc -l' # run calculator with standard math library
alias bi='brew install'
alias brewster='zsh /Users/syd/Code/misc/Brewster/brewster.zsh'
alias cd..='cd ..'
alias cdl='cd l'
alias cls='clear'
alias cnt='find . -maxdepth 1 | wc -l' # count items in directory
alias cntf='find . -type f -maxdepth 1 | wc -l' # count [f]iles in directory
alias diff='colordiff -u'
alias egrep='grep -E --color=auto' # direct invocation as either "egrep|fgrep" is deprecated
alias fgrep='grep -F --color=auto' # direct invocation as either "egrep|fgrep" is deprecated
alias fp='realpath -m' # canonicalized absolute pathname
alias gitp='git push && git status'
alias gits='git status'
alias grep='grep --color=auto'
alias h='history'
alias ip='curl -sw "\n" https://ifconfig.me/ip | tee >(tr -d "\n" | pbcopy)'
alias j='jobs -l'
alias ls='ls -alh'
alias lsd='ls -aFGhort' # sort by [d]ate, descending
alias lsn='ls -aFGhor'  # sort by [n]ame, descending
alias lss='ls -aFGhorS' # sort by [s]ize, descending
alias meteo='bash /Users/syd/Code/meteo/meteo.sh'
alias mkdir='mkdir -pv'
alias nm='cd /Users/syd/Dropbox/nvalt_repo ; printf "\033c\n" ; lsd | grep --invert-match "dr.*" | tail -10' # shows 10 most recent files in nvalt_repo
alias path='echo -e ${PATH//:/\\n}'
alias png='ping -c10 1.1.1.1'
alias rm='rm -Rfdi'
alias scanz='zsh /Users/syd/Code/misc/scanz/scanz.sh'
alias teux='vim /Users/syd/Dropbox/nvalt_repo/teuxdeux--\ task-list-\ working.md'
alias tma='tmux -CC attach'
alias tmx='tmux -CC new -s 🤓'
alias wttr='curl https://wttr.in/YKF\?F --silent --max-time 3'
alias zcp='zmv -C'  # force cp    - copy
alias zln='zmv -L'  # force ln    - hard link
alias zs='vim /Users/syd/.zshrc'
alias zsl='zmv -Ls' # force ln -s - symbolic link
alias {g,r}eadlink='realpath -m' # canonicalized absolute pathname; does not require directory &/or path components

## <Privileged Access>
if [[ "$UID" -ne 0 ]]; then
  alias dgk='sudo spctl --master-disable # disable Gatekeeper'
  alias egk='sudo spctl --master-enable # enable Gatekeeper'
  alias rms='sudo rm -Rfd'
  alias sd='sudo shutdown -h +1 - "==> SHUTTING DOWN <== in one (1) minute. To abort, type ^C."'
  alias sr='sudo shutdown -r now - "==> REBOOTING <== now!" To abort, type ^C."'
  alias svi='sudo vi'
  alias top='sudo htop -s PERCENT_MEM'
fi
### https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
## </Privileged Access>
# </Aliases>
