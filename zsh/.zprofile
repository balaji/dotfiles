<<<<<<< Updated upstream
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

=======
>>>>>>> Stashed changes
# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/balaji/.docker/bin"
# End of Docker Desktop section.

case `uname` in
    Linux)
        alias ls='ls --color'
        export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
        export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
        export BREW_HOME=/home/linuxbrew/.linuxbrew
        export PNPM_HOME="$HOME/.local/share/pnpm"
        export JAVA_HOME=/usr/lib/jvm/default
        export ANDROID_SDK_HOME=$HOME/Android/Sdk
        ;;
    Darwin)
        export DISABLE_SPRING=1
        export EDITOR=vim
        export BREW_HOME=/opt/homebrew
        export PNPM_HOME="$HOME/Library/pnpm"
	export ANDROID_SDK_HOME=$HOME/Library/Android/sdk
	export PATH=$BREW_HOME/opt/coreutils/libexec/gnubin:$PATH
        ;;
esac

eval "$($BREW_HOME/bin/brew shellenv)"

case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME:$PNPM_HOME/bin:$PATH" ;;
esac

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


export PATH="$HOME/.composio:$HOME/.local/bin:$HOME/.cargo/bin:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/emulator:$PATH"
