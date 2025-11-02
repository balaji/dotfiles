if status is-interactive
    # Commands to run in interactive sessions can go here
end
# starship init fish | source

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

export VISUAL="emacsclient -c -nw -a ''"
export EDITOR="emacsclient -c -nw -a ''"
