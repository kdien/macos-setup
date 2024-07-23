#!/usr/bin/env bash
# shellcheck disable=SC2016,SC2046

# Hide dock and remove delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
killall Dock

# Disable AppleFontSmoothing for Alacritty
defaults write org.alacritty AppleFontSmoothing -int 0

# Symlink .bashrc
rm -f "$HOME/.bashrc"
ln -sf "$HOME/macos-setup/.bashrc" "$HOME/.bashrc"

# Source .bashrc
echo '. "$HOME/.bashrc"' >>"$HOME/.bash_profile"

# Clone dotfiles and setup config
git clone https://github.com/kdien/dotfiles.git "$HOME/dotfiles"
mkdir -p "$HOME/.config"

configs=(
  karabiner
  nvim
  powershell
  tmux
  wezterm
)
for config in "${configs[@]}"; do
  ln -sf "$HOME/dotfiles/$config" "$HOME/.config/$config"
done
cp -r "$HOME/dotfiles/alacritty" "$HOME/.config"

# Get baseline git config
cp "$HOME/dotfiles/git/config" "$HOME/.gitconfig"

# Get ssh config
mkdir -p "$HOME/.ssh"
cat "$HOME/dotfiles/ssh/config" >>"$HOME/.ssh/config"

# Install homebrew
if ! command -v brew &>/dev/null; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install brew formulae
brew install $(cat ./formulae)

# Install brew casks
brew install --cask $(cat ./casks)

# Add bash to list of eligible shell
echo "$(brew --prefix)/bin/bash" | sudo tee -a /etc/shells

# Set symlink for OpenJDK
sudo ln -sfn "$(brew --prefix)/opt/openjdk/libexec/openjdk.jdk" /Library/Java/JavaVirtualMachines/openjdk.jdk
