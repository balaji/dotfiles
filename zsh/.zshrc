export HISTFILE=~/.histfile

HISTSIZE=10000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -e
zstyle :compinstall filename '~/.zshrc'
skip_global_compinit=1
fpath+=~/.zfunc; autoload -Uz compinit; compinit
# End of lines added by compinstall

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

alias g='git'
alias gpl='git pull'
alias gpu='git push'
alias gst='git status'
alias ga='git add'
alias gsh='git stash'
alias gco='git checkout'
alias gcm='git commit'
alias gr='git rm'
alias gfu='git fetch upstream'
alias ls='ls -G --color=auto'
alias tmux='tmux new -A -s main'
alias e='emacsclient -c -a ""'

ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[yellow]%}"
