{ pkgs, ... }:

{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    nerd-fonts.fira-code
  ];
}