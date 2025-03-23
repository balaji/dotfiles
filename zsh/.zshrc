HISTFILE=~/.histfile

HISTSIZE=10000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -e
zstyle :compinstall filename '~/.zshrc'
skip_global_compinit=1
# End of lines added by compinstall

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/git-prompt.zsh/git-prompt.zsh
source ~/.zsh/git-prompt.zsh/examples/multiline.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# if [ "$TMUX" = "" ]; then tmux new -A -s main; fi 

alias e=emacsclient
alias g='git'
alias gpl='git pull'
alias gpu='git push'
alias gst='git status'
alias ga='git add'
alias gsh='git stash'
alias gco='git commit'
alias gr='git rm'
alias gfu='git fetch upstream'
alias r3=rebar3
alias vim=nvim

case `uname` in
    Linux)
    alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto --unity-launch"
    alias spotify="spotify --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto --unity-launch"
    alias 1password="1password --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto --unity-launch"
    alias steam="steam --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto --unity-launch"
    alias docker=podman
    alias e='emacsclient -c -a ""'
    export PATH="/home/balaji/bin:$PATH:/home/balaji/.local/share/JetBrains/Toolbox/scripts"
    export GTK_MODULES="unity-gtk-module"
    export SAL_USE_VCLPLUGIN=gtk
    ;;
    Darwin)
    ;;
esac

[ -f "/home/balaji/.ghcup/env" ] && . "/home/balaji/.ghcup/env" # ghcup-env


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
