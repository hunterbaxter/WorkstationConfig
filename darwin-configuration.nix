{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.ansible
      pkgs.black
      pkgs.cmake
      pkgs.dos2unix
      pkgs.exa
      pkgs.fd
      pkgs.git
      pkgs.graphviz
      pkgs.htop
      pkgs.isort
      pkgs.jetbrains-mono
      pkgs.jq
      pkgs.luajit
      pkgs.mypy
      pkgs.mypy-protobuf
      pkgs.neofetch
      pkgs.neovim
      pkgs.nodejs_20
      pkgs.nodePackages.fixjson
      pkgs.nodePackages.prettier
      pkgs.nodePackages.pyright
      pkgs.nodePackages.vscode-langservers-extracted
      pkgs.poetry
      pkgs.poppler_utils
      pkgs.python312
      pkgs.ranger
      pkgs.ripgrep
      pkgs.shellcheck
      pkgs.shell_gpt
      pkgs.shellharden
      pkgs.shfmt
      pkgs.speedtest-cli
      pkgs.sqlite
      pkgs.taskwarrior
      pkgs.taskwarrior-tui
      pkgs.tealdeer
      pkgs.texlab
      pkgs.texlive.combined.scheme-full
      pkgs.tree-sitter
      pkgs.tree-sitter-grammars.tree-sitter-nix
      pkgs.tree-sitter-grammars.tree-sitter-python
      pkgs.wezterm
      pkgs.wget
      pkgs.zathura
      pkgs.zola
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh = {
    enable = true;
  };
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
