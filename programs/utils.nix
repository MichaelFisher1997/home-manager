{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
    rpi-imager
    socat
  ];
}
