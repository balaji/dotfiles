#!/bin/bash

rm -rf ~/.emacs.d
mkdir ~/.emacs.d

ln -s ~/projects/dotfiles/emacs/init.el ~/.emacs.d/init.el
ln -s ~/projects/dotfiles/emacs/early-init.el ~/.emacs.d/early-init.el

rm -rf ~/.zshrc
rm -rf ~/.profile
rm -rf ~/.tmux.conf
ln -s ~/projects/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/projects/dotfiles/zsh/.profile ~/.profile
ln -s ~/projects/dotfiles/tmux/.tmux.conf ~/.tmux.conf

rm -rf ~/.zsh
mkdir ~/.zsh
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/zsh-autocomplete
git clone --depth 1 -- https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone --depth=1 -- https://github.com/woefe/git-prompt.zsh ~/.zsh/git-prompt.zsh
git clone --depth=1 -- https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

rm -rf ~/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
