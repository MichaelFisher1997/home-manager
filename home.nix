{ config, pkgs, ... }:
{
  home.username = "micqdf";
  home.homeDirectory = "/home/micqdf";

  # targets.genericLinux.enable = true;

  home.stateVersion = "24.05"; # Please read the comment before changing.
  imports = [
    ./fish/fish.nix
    ./nvim/nvim.nix
  ];


  home.packages = with pkgs; [
    (catppuccin-kvantum.override {
      accent = "blue";
      variant = "mocha";
    })
    neovide
    zathura
    grc
    highlight
    # Nix curl
    nurl
    # Nix formatting
    nixpkgs-fmt
    nixpkgs-review
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

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "neovide.desktop" ];
    "application/pds" = [ "zathura.desktop" ];
  };


  home.sessionPath = [
    "$BUN_INSTALL/bin"
    "$HOME/go/bin"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}  

