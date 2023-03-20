{ config, pkgs, ... }:

{
  home.username = "hb";
  home.homeDirectory = "/home/hb";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.brave
    pkgs.htop
    pkgs.jetbrains-mono
    pkgs.pulsemixer
    pkgs.ranger
    pkgs.zotero
    pkgs.veracrypt
    pkgs.wipe
    pkgs.neofetch
    pkgs.speedtest-cli
    pkgs.julia
    pkgs.flameshot
    pkgs.drawio
    pkgs.zathura
    pkgs.neomutt

    # run `rustup default stable` to install stuff
    pkgs.rustup
    pkgs.ripgrep
    pkgs.fd
    pkgs.tealdeer
  ];
}
