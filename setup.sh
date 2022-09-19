#!/usr/bin/env bash

# Hide dock and remove delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
killall Dock

# Fix font smoothing for non-Retina displays
defaults -currentHost write -g AppleFontSmoothing -int 1

# Enable Debug menu in Safari
defaults write com.apple.Safari IncludeInternalDebugMenu 1

# Get pureline bash prompt
git clone https://github.com/chris-marsh/pureline.git "$HOME"/pureline

# Clone dotfiles and setup symlinks
git clone https://github.com/kdien/dotfiles.git "$HOME"/dotfiles
ln -sf "$HOME"/dotfiles/tmux/.tmux.conf "$HOME"/.tmux.conf
ln -sf "$HOME"/dotfiles/vim/.vimrc "$HOME"/.vimrc
mkdir -p "$HOME"/.vim
ln -sf "$HOME"/dotfiles/vim/coc-settings.json "$HOME"/.vim/coc-settings.json
ln -sf "$HOME"/dotfiles/alacritty "$HOME"/.config/alacritty
ln -sf "$HOME"/dotfiles/pureline/.pureline.conf "$HOME"/.pureline.conf
ln -sf "$HOME"/dotfiles/powershell "$HOME"/.config/powershell

cat >> "$HOME"/.bashrc <<'EOF'
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
[[ -f "$HOME"/dotfiles/bash/.bash_common ]] && . "$HOME"/dotfiles/bash/.bash_common
EOF

# Get baseline git config
cp "$HOME"/dotfiles/git/config "$HOME"/.gitconfig

# Get ssh config
mkdir -p "$HOME"/.ssh
cat "$HOME"/dotfiles/ssh/config >> "$HOME"/.ssh/config

# Tap additional brew repos
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers

# Install brew formulae
brew install $(cat ./formulae)

# Install brew casks
brew install --cask $(cat ./casks)

# Set up symlink for OpenJDK11
sudo ln -sfn $(brew --prefix)/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
