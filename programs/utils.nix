{ pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    btop
    fastfetch
    calc
    maim
    xclip
    xdotool
    pywal
    networkmanager_dmenu
    pika-backup
    sunshine
    guacamole-client
  ];
}