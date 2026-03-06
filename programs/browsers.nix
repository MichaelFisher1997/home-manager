{ pkgs, zen-browser, ... }:

{
  home.packages = with pkgs; [
    brave
    google-chrome
    chromium
    firefox
    tor-browser
    kdePackages.falkon
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight
  ];
}