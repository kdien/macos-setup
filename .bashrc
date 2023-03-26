#!/usr/bin/env bash
eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ -z "$HOMEBREW_PREFIX" ]]; then
    HOMEBREW_PREFIX="$(brew --prefix)"
fi

PATH="$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
export PATH

[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
[[ -f "$HOME"/dotfiles/bash/.bash_common ]] && . "$HOME"/dotfiles/bash/.bash_common

