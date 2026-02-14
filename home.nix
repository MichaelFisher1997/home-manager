{ config, pkgs, pkgs_32, nixvim, lib, unstable, cursor-flake, windsurf-flake, terminus-flake, opencode-desktop-flake, ... }:
{
  home.username = "micqdf";
  home.homeDirectory = "/home/micqdf";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-36.9.5"
  ];

  # Pass unstable packages to modules
  _module.args.unstable = unstable;

  targets.genericLinux.enable = true;

  home.stateVersion = "25.05"; # Please read the comment before changing.
  imports = [
    nixvim.homeModules.nixvim
    ./nvim/nixvim.nix
    ./fish/fish.nix
    ./modules/portal-config.nix
    ./zsh/zsh.nix
    ./alacritty/alacritty.nix
    ./obs/obs.nix
    # ./modules/ide/windsurf.nix
    ./programs/programs.nix
    ./hyprland/hyprland.nix
  ];




  # Activation script for Playwright
  home.activation.playwright-install = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "Installing Playwright browsers..."
    PATH=${pkgs.lib.makeBinPath [ pkgs.nodejs_24 ]}:$PATH ${pkgs.nodejs_24}/bin/npm exec playwright install
  '';



  home.sessionVariables = {
    EDITOR = "nvim";
    BUN_INSTALL = "$HOME/.bun";
    SHELL = "${pkgs.fish}/bin/fish";
    NPM_CONFIG_PREFIX = "$HOME/.npm-global";
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "MichaelFisher1997";
        email = "contact@michaelfisher.tech";
      };
      alias = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "zen-twilight.desktop" ];
    "x-scheme-handler/http" = [ "zen-twilight.desktop" ];
    "x-scheme-handler/https" = [ "zen-twilight.desktop" ];
    "x-scheme-handler/about" = [ "zen-twilight.desktop" ];
    "x-scheme-handler/unknown" = [ "zen-twilight.desktop" ];
  };


  home.sessionPath = [
    "$HOME/.npm-global/bin"
    "$BUN_INSTALL/bin"
    "$HOME/go/bin"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
