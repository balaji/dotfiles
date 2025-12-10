HISTFILE=~/.histfile

HISTSIZE=10000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -e
zstyle :compinstall filename '~/.zshrc'
skip_global_compinit=1
fpath+=~/.zfunc; autoload -Uz compinit; compinit
# End of lines added by compinstall

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/git-prompt.zsh/git-prompt.zsh
source ~/.zsh/git-prompt.zsh/examples/multiline.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

alias g='git'
alias gpl='git pull'
alias gpu='git push'
alias gst='git status'
alias ga='git add'
alias gsh='git stash'
alias gco='git commit'
alias gr='git rm'
alias gfu='git fetch upstream'
alias vim=nvim
alias ls='ls --color=auto'
alias tmux='tmux new -A -s main'
alias e='emacsclient -c -a ""'

case `uname` in
    Linux)
    export PATH="/home/balaji/.local/bin:$PATH"
    alias ls='ls --color'
    ;;
    Darwin)
	source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
    ;;
esac

ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[yellow]%}"
export VISUAL="emacsclient -c -nw -a ''"
export EDITOR="emacsclient -c -nw -a ''"
