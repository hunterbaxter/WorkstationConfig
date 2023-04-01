#!/bin/bash

# before anything else
sudo dnf install util-linux-user zsh

# https://docs.fedoraproject.org/en-US/quick-docs/changing-selinux-states-and-modes/
# WARN: nix doesn't work with selinux, also has some annoying error on fedora
sudo dnf groupinstall -y "Development Tools" "Development Libraries" "Virtualization"
sudo dnf install -y \
	clang \
	i3 dmenu xrandr \
	sway waybar alacritty \
	python3 python3-pip \
	vagrant \
    nmap

# sudo apt install -y \
#     build-essential \
#     linux-tools-"$(uname -r)" \
#     cmake \
#     clang \
#     python3 python3-pip \
#     npm \
#     virtualbox virtualbox-dkms dkms vagrant \
#     libfuse2
#
# # install development packages
# sudo apt install -y \
#     build-essential \
#     linux-tools-"$(uname -r)" \
#     cmake \
#     clang \
#     python3 python3-pip \
#     npm \
#     virtualbox virtualbox-dkms dkms vagrant \
#     libfuse2
#
# # install desktop packages
# sudo apt install -y \
#     sway swaylock swayidle waybar \
#     xwayland wl-clipboard \
#     libfontconfig-dev \
#     pulseaudio pipewire mpv \
#     linux-sound-base \
#     texlive-full
# NOTE: maybe alsa-base alsa-utils

# sudo adduser "$USER" audio
# sudo timedatectl set-timezone America/Chicago

# Gem5 stuff
# sudo apt install build-essential git m4 scons zlib1g zlib1g-dev \
#   libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
#   python3-dev libboost-all-dev pkg-config
# sudo apt install python-six zlib1g-dev libpng-dev swig
#
# had to disable secure boot for virtualbox to work
# sudo apt install mokutil
# sudo mokutil -–disable-validation
# FIXME: sudo can't use any of these binaries
brave
htop
pulsemixer
ranger
zotero
veracrypt
wipe
jq
neofetch
speedtest-cli
julia
drawio
zathura
neomutt
nodejs
nettools
zoom-us # needs xdg-open

# rust
rustup
ripgrep
fd
tealdeer
exa
