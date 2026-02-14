{ pkgs, ... }:

{
  home.packages = with pkgs; [
    anchor
    foundry
  ];
}