{ pkgs, neonfetch, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    neonfetch.packages.${pkgs.system}.default
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
    speedtest-cli
    libinput
  ];
}
