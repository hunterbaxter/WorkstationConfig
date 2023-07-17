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
# export TERMINAL="alacritty"
export TERMINAL="wezterm"
export BROWSER="google-chrome"

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
export PATH=$PATH:/usr/lib64

export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels
# export PATH=$PATH:/bin
# export PATH=$PATH:$HOME/.nix-profile/bin
#  . "$HOME/.cargo/env"
# export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CC="/usr/bin/clang"
export CXX="/usr/bin/clang++"
export M5_PATH="$HOME/miner/m5_binaries"
export JULIA_NUM_THREADS=8
export TASKDDATA="$HOME/.local/taskd"
export cpr_DIR=/usr/local/include/cpr
export INFLUXDB_TOKEN=6Ansc3g4lt8ggMA_YgSGpDy_2HFpRMXh7Ov3_Tu7LnfPhYV8A4RU5FulOdfVZv78hill-7pjm9j7j5JvzhRRrw==
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# I should use xdg-ninja to clean this up

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# source $HOME/.nix-profile/etc/profile.d/nix.sh
