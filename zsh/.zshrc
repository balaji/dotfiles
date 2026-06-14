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

case `uname` in
    Linux)
        export PATH="/home/balaji/.local/bin:/usr/local/emacs/bin:$PATH"
        alias ls='ls --color'
        export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
	export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:~/.local/share/flatpak/exports/share
        ;;
    Darwin)
        export PATH="$HOME/.local/bin:$PATH"
	export DISABLE_SPRING=1
	export EDITOR=vim
        ;;
esac

ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[yellow]%}"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
export HSTR_TIOCSTI=y


# bun completions
[ -s "/Users/balaji/.bun/_bun" ] && source "/Users/balaji/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
