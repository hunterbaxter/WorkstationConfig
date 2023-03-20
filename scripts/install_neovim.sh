#!/bin/bash
# NOTE: installing in cargo directory since I don't have a place for app images
mkdir -p "$HOME/.cargo/bin"
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage "$HOME/.cargo/bin/nvim"
chmod u+x "$HOME/.cargo/bin/nvim"
