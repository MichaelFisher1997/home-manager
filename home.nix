{ config, pkgs, pkgs_32, nixvim, lib, unstable, windsurf-flake, droid-flake, opencode-desktop-flake, vars, ... }:
{
  imports = [
    ./modules/core/home.nix
  ];
}
