eval "$(/opt/homebrew/bin/brew shellenv)"

PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
export PATH

[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
[[ -f "$HOME"/dotfiles/bash/.bash_common ]] && . "$HOME"/dotfiles/bash/.bash_common

