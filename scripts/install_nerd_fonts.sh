#!/bin/bash
# WARN: this will take up approx. 40gb
# I haven't ever taken the time to pull out the specific ones I need
git clone https://github.com/ryanoasis/nerd-fonts.git "$HOME/.nerd-fonts"
cd "$HOME/.nerd-fonts" || exit
./install.sh
