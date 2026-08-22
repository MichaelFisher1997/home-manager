{ pkgs, droid-flake, modal-flake, ... }:

{
  home.packages = [
    droid-flake.packages.x86_64-linux.default
    modal-flake.packages.x86_64-linux.default
  ];
}