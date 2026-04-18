{ pkgs, lib, vars, ... }:
let
  isLaptop = vars.hostName == "hyprtop";
in {
  home.packages = with pkgs; [
    waypaper
    wl-clipboard
    blueman
    networkmanagerapplet
    rofi
    wttrbar
    hackgen-nf-font
    playerctl
    swaybg
    swww
    nwg-look
    udiskie
    hyprshot
    xfce.thunar-volman
    xfce.thunar-dropbox-plugin
    xfce.thunar-archive-plugin
    xfce.tumbler
    pavucontrol
    wlr-randr
    libcanberra-gtk3
    pamixer
    grim
    discocss
    catppuccin-kvantum
    nwg-drawer
    hyprpaper
    hyprlock
    wlsunset
  ] ++ lib.optionals isLaptop [
    hypridle
  ];
}
