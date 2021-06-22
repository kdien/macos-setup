#!/bin/bash

# Clone dotfiles and setup symlinks
git clone https://github.com/kdien/dotfiles.git $HOME/dotfiles
[[ -f $HOME/.zshrc ]] && mv $HOME/.zshrc $HOME/.zshrc.bak
ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/zsh/.zsh_aliases $HOME/.zsh_aliases
ln -sf $HOME/dotfiles/zsh/.zsh_functions $HOME/.zsh_functions
ln -sf $HOME/dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/vim/.vimrc $HOME/.vimrc

# Tap brew font repo
brew tap homebrew/cask-fonts

# Install brew formulae
brew install $(cat ./formulae)

# Install brew casks
brew install --cask $(cat ./casks)

