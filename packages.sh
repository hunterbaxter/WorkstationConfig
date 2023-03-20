#!/bin/bash

# install development packages
sudo apt install -y \
    build-essential \
    linux-tools-"$(uname -r)" \
    cmake \
    clang \
    python3 python3-pip \
    npm \
    virtualbox vagrant \
    libfuse2

# install desktop packages
sudo apt install -y \
    sway swaylock waybar \
    xwayland wl-clipboard \
    libfontconfig-dev \
    pulseaudio pipewire mpv \
    linux-sound-base \
    texlive-full
# NOTE: maybe alsa-base alsa-utils

# sudo adduser "$USER" audio
# sudo timedatectl set-timezone America/Chicago
