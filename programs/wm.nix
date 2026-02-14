{ pkgs, ... }:

{
  home.packages = with pkgs; [
    i3
    eww
    hyprsunset
    arandr
    nitrogen
    polybarFull
    picom
    themechanger
  ];
}