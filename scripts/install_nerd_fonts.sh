#!/bin/bash
git clone git@github.com:ryanoasis/nerd-fonts.git "$HOME/.nerd-fonts"
cd "$HOME/.nerd-fonts" || exit
./install.sh
