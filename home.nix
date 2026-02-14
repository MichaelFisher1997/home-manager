{ config, pkgs, pkgs_32, nixvim, lib, unstable, cursor-flake, windsurf-flake, droid-flake, opencode-desktop-flake, ... }:
{
  home.username = "micqdf";
  home.homeDirectory = "/home/micqdf";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-36.9.5"
  ];

  targets.genericLinux.enable = true;
  home.stateVersion = "25.05";

  imports = [
    nixvim.homeModules.nixvim
    ./nvim/nixvim.nix
    ./fish/fish.nix
    ./zsh/zsh.nix
    ./alacritty/alacritty.nix
    ./obs/obs.nix
    ./modules/portal-config.nix
    ./modules/git.nix
    ./modules/session.nix
    ./modules/activation.nix
    ./hyprland/hyprland.nix
    ./programs/dev/languages.nix
    ./programs/dev/editors.nix
    ./programs/dev/tools.nix
    ./programs/gaming/launchers.nix
    ./programs/gaming/libs.nix
    ./programs/gaming/games.nix
    ./programs/shell/tools.nix
    ./programs/browsers.nix
    ./programs/multimedia.nix
    ./programs/crypto.nix
    ./programs/ai.nix
    ./programs/utils.nix
    ./programs/files.nix
    ./programs/wm.nix
    ./programs/fonts.nix
    ./programs/security.nix
  ];

  programs.home-manager.enable = true;
}