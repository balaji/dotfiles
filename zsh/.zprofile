case `uname` in
    Linux)
        alias ls='ls --color'
        export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
        export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
        export BREW_HOME=/home/linuxbrew/.linuxbrew
        export PNPM_HOME="/home/balaji/.local/share/pnpm"
        ;;
    Darwin)
        export DISABLE_SPRING=1
        export EDITOR=vim
        export BREW_HOME=/opt/homebrew
        export PNPM_HOME="$HOME/Library/pnpm"
        ;;
esac

eval "$($BREW_HOME/bin/brew shellenv)"

case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME:$PNPM_HOME/bin:$PATH" ;;
esac

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
export HSTR_TIOCSTI=y


# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
