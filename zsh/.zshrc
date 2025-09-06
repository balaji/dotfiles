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
# source ~/.zsh/git-prompt.zsh/git-prompt.zsh
# source ~/.zsh/git-prompt.zsh/examples/pure.zsh
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
if [ "$TMUX" = "" ]; then tmux new -A -s main; fi

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
alias ls='ls --color=auto'

case `uname` in
    Linux)
    # alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto"
    # alias spotify="spotify --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto"
    # alias 1password="1password --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto"
    # alias steam="steam --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto"
    # alias obsidian="obsidian --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto"
    # alias google-chrome="google-chrome --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto"
    alias e='emacsclient -c -a ""'
    export PATH="/home/balaji/.local/bin:$PATH"
    alias ls='ls --color'
    # export GTK_MODULES="unity-gtk-module"
    # export SAL_USE_VCLPLUGIN=gtk
    # export ELECTRON_OZONE_PLATFORM_HINT=wayland
    ;;
    Darwin)
        alias e="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
        alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
    ;;
esac
