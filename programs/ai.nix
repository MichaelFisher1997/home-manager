{ pkgs, droid-flake, ... }:

{
  home.packages = with pkgs; [
    droid-flake.packages.x86_64-linux.default
  ];
}