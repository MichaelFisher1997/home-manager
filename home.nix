{ config, pkgs, nixvim, ... } @ args:
let
  system = args.system or "x86_64-linux"; # fallback for non-flake
  unstable = import
    (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
      sha256 = "1i3sj7bapriaanmnlrr6p3khr20j1k59il12fkww78ik2xa81vyx";
    })
    {
      config.allowUnfree = true;
      system = system;
    };
in
{
  home.username = "micqdf";
  home.homeDirectory = "/home/micqdf";
  nixpkgs.config.allowUnfree = true;

  # targets.genericLinux.enable = true;

  home.stateVersion = "24.11"; # Please read the comment before changing.
  imports = [
    ./fish/fish.nix
    nixvim.homeManagerModules.nixvim
    ./nvim/nixvim.nix
  ];


  home.packages = with pkgs; [
    grc
    highlight
    # Nix curl
    nurl
    # Nix formatting
    nixpkgs-fmt
    nixpkgs-review
    #for work
    unstable.zellij
    sqlite
    minikube
    kubectl
    helm
    fastfetch
    # Version Control
    gh
    git
    git-lfs
    nix-prefetch-git

    # Shell Utilities
    curl
    wget
    tree
    fd
    fzf
    bat
    thefuck
    lolcat
    lsd
    tldr
    # programming languages
    unstable.go
    unstable.golangci-lint
    unstable.golangci-lint-langserver
    terraform
    lua
		love
    cargo
    unstable.bun
    unstable.air
    tailwindcss
    openjdk
    php
    python3
    zig

    # Fonts
    noto-fonts-color-emoji
    twemoji-color-font

  ];


  home.sessionVariables = {
    EDITOR = "nvim";
    BUN_INSTALL = "$HOME/.bun";
  };

  programs.git = {
    enable = true;
    userName = "MichaelFisher1997";
    userEmail = "contact@michaelfisher.tech";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
  };

#  xdg.mimeApps.defaultApplications = {
#    "text/plain" = [ "neovide.desktop" ];
#    "application/pds" = [ "zathura.desktop" ];
#  };


  home.sessionPath = [
    "$BUN_INSTALL/bin"
    "$HOME/go/bin"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}  

