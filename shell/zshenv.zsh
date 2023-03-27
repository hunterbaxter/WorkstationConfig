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
export BROWSER="brave-browser"

mkdir -p $XDG_CACHE_HOME/zsh
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export HISTSIZE=100000  # maximum events for internal history
export SAVEHIST=100000 # maximum events for history file

# for some reason, these do not work anymore
export PATH=$PATH:$HOME/Applications
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels
# export PATH=$PATH:/bin
# export PATH=$PATH:$HOME/.nix-profile/bin
#  . "$HOME/.cargo/env"
# export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CC="/usr/bin/clang"
export CXX="/usr/bin/clang++"
# I should use xdg-ninja to clean this up

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# source $HOME/.nix-profile/etc/profile.d/nix.sh
