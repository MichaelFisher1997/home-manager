{ config, pkgs, pkgs_32, nixvim, lib, unstable, droid-flake, opencode-desktop-flake, neonfetch, vars, ... }:
{
  imports = [
    ./modules/core/home.nix
  ];
}
