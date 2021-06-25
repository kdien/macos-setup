#!/bin/bash

# Clone dotfiles and setup symlinks
git clone https://github.com/kdien/dotfiles.git $HOME/dotfiles
[[ -f $HOME/.zshrc ]] && mv $HOME/.zshrc $HOME/.zshrc.bak
ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/zsh/.zsh_aliases $HOME/.zsh_aliases
ln -sf $HOME/dotfiles/zsh/.zsh_functions $HOME/.zsh_functions
ln -sf $HOME/dotfiles/zsh/.p10k.zsh $HOME/.p10k.zsh
ln -sf $HOME/dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/vim/.vimrc $HOME/.vimrc
ln -sf /opt/homebrew/opt/powerlevel10k $HOME/powerlevel10k

# Tap additional brew repos
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers
brew tap romkatv/powerlevel10k

# Install brew formulae
brew install $(cat ./formulae)

# Install brew casks
brew install --cask $(cat ./casks)

# Set up symlink for OpenJDK11
sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

