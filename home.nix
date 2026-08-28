{ config, pkgs, pkgs_32, nixvim, lib, unstable, opencode-desktop-flake, neonfetch, vars, ... }:
{
  imports = [
    ./modules/core/home.nix
  ];
}
