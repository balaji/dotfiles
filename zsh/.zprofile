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

export PATH="$HOME/.local/bin:$PATH"

# Added by `rbenv init` on Mon May 18 12:25:48 CEST 2026
eval "$(rbenv init - --no-rehash zsh)"

case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME:$PNPM_HOME/bin:$PATH" ;;
esac

export NVM_DIR="$HOME/.nvm"
[ -s "$BREW_HOME/opt/nvm/nvm.sh" ] && \. "$BREW_HOME/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$BREW_HOME/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$BREW_HOME/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Source - https://stackoverflow.com/a/39519460
# Retrieved 2026-05-19, License - CC BY-SA 4.0
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

. "$HOME/.cargo/env"

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
