#!/bin/bash

# install development packages
sudo apt install -y \
    build-essential \
    linux-tools-"$(uname -r)" \
    cmake \
    clang \
    python3 python3-pip \
    npm \
    virtualbox virtualbox-dkms dkms vagrant \
    libfuse2

# install desktop packages
sudo apt install -y \
    sway swaylock swayidle waybar \
    xwayland wl-clipboard \
    libfontconfig-dev \
    pulseaudio pipewire mpv \
    linux-sound-base \
    texlive-full
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
