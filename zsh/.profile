
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/balaji/.lmstudio/bin"
# End of LM Studio CLI section

. "$HOME/.cargo/env"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
