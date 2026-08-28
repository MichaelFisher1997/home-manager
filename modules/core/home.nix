{ config, pkgs, pkgs_32, nixvim, lib, unstable, opencode-desktop-flake, neonfetch, vars, ... }:
{
  home.username = vars.user.name;
  home.homeDirectory = vars.user.homeDirectory;
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = vars.stateVersion;

  imports = [
    nixvim.homeModules.nixvim
    ../../nvim/nixvim.nix
    ../../fish/fish.nix
    ../../zsh/zsh.nix
    ../../alacritty/alacritty.nix
    ../../obs/obs.nix
    ../../modules/portal-config.nix
    ../../modules/gtk.nix
    ../../modules/git.nix
    ../../modules/session.nix

    ../../hyprland/hyprland.nix
    ../../programs/dev/languages.nix
    ../../programs/dev/editors.nix
    ../../programs/dev/tools.nix
    ../../programs/gaming/launchers.nix
    ../../programs/gaming/libs.nix
    ../../programs/gaming/games.nix
    ../../programs/shell/tools.nix
    ../../programs/shell/ghostty.nix
    ../../programs/browsers.nix
    ../../programs/multimedia.nix
    ../../programs/utils.nix
    ../../programs/files.nix
    ../../programs/wm.nix
    ../../programs/fonts.nix
    ../../programs/security.nix
  ];

  programs.home-manager.enable = true;
}
