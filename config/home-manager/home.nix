{ config, pkgs, ... }:

{
  # FIXME: sudo can't use any of these binaries
  home.username = "h";
  home.homeDirectory = "/home/h";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
  # fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.brave
    # pkgs.htop
    # pkgs.pulsemixer
    pkgs.ranger
    # pkgs.zotero
    # pkgs.veracrypt
    # pkgs.wipe
    pkgs.jq
    # pkgs.neofetch
    # pkgs.speedtest-cli
    # pkgs.julia
    pkgs.drawio
    pkgs.zathura
    pkgs.neomutt
    # pkgs.grim # grab images from a wayland compositor
    # pkgs.slurp # wayland select area
    pkgs.nodejs
    # pkgs.nettools
    # pkgs.zoom-us # needs xdg-open
    # pkgs.xdg-utils
    # remember to uninstall partition manager

    # run `rustup default stable` to install stuff
    pkgs.rustup
    pkgs.ripgrep
    pkgs.fd
    pkgs.tealdeer
    pkgs.exa
  ];
}
