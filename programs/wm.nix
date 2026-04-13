{ pkgs, ... }:

{
  home.packages = with pkgs; [
    eww
    hyprsunset
  ];
}