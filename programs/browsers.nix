{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    google-chrome
    chromium
    firefox
    tor-browser
    kdePackages.falkon
  ];
}