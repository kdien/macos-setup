#!/usr/bin/env bash
# shellcheck disable=SC1091

eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ -z "$HOMEBREW_PREFIX" ]]; then
  HOMEBREW_PREFIX="$(brew --prefix)"
fi

PATH="$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="$HOMEBREW_PREFIX/opt/make/libexec/gnubin:$PATH"
PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"

[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
[[ -f "$HOME/dotfiles/bash/.bash_common" ]] && . "$HOME/dotfiles/bash/.bash_common"

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.goenv/shims:$PATH"

export PATH
