{ config, pkgs, pkgs_32, nixvim, lib, ... } @ args:
let
  system = args.system or "x86_64-linux"; # fallback for non-flake
  unstable = import
    (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
      sha256 = "11qdsgrzaqmmwmll706q005dbfsfb0h1nhswc4pkldm0hxrlvcal";
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

  # Pass unstable packages to modules
  _module.args.unstable = unstable;

  targets.genericLinux.enable = true;

  home.stateVersion = "25.05"; # Please read the comment before changing.
  imports = [
    nixvim.homeManagerModules.nixvim
    ./nvim/nixvim.nix
    ./fish/fish.nix
    ./modules/portal-config.nix
    ./zsh/zsh.nix
    ./alacritty/alacritty.nix
    ./obs/obs.nix
    ./modules/ide/windsurf.nix
    ./programs/programs.nix
  ];




  # Activation script for Playwright
  home.activation.playwright-install = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "Installing Playwright browsers..."
    PATH=${pkgs.lib.makeBinPath [ pkgs.nodejs_20 ]}:$PATH ${pkgs.nodejs_20}/bin/npm exec playwright install
  '';



  home.sessionVariables = {
    EDITOR = "nvim";
    BUN_INSTALL = "$HOME/.bun";
    SHELL = "${pkgs.fish}/bin/fish";
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
