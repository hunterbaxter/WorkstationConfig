# System Environmental Variables
# These should be defined in /etc/zshenv or /etc/zsh/zshenv
# export HOME="/home/username"
# export ZDOTDIR="$HOME/shell"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CURRENT_DESKTOP="Sway"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export LANG="en_US.utf8"

mkdir -p $XDG_CACHE_HOME/zsh
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export HISTSIZE=100000  # maximum events for internal history
export SAVEHIST=100000 # maximum events for history file

# for some reason, these do not work anymore
# path+=('/usr/local/go/bin')
# path+=('$HOME/.local/bin')
export PATH=$PATH:$HOME/Applications
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH
#  . "$HOME/.cargo/env"
# export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CC="/usr/bin/clang"
export CXX="/usr/bin/clang++"
# I should use xdg-ninja to clean this up

# source $HOME/.nix-profile/etc/profile.d/nix.sh
