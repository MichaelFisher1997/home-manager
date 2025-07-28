{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
  };

  # Use existing config files from ~/.config instead of managing them through home-manager
  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/micqdf/.config/hypr";

  # Install Hyprland-related packages
  home.packages = with pkgs; [
    waypaper
    wl-clipboard
    blueman
    rofi-wayland
    waybar
    polybar
    wttrbar
    hackgen-nf-font
    playerctl
    swaybg
    swww
    nwg-look
    dunst
    udiskie
    hyprshot
    hyprland-protocols
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
    themechanger
    catppuccin-kvantum
    nwg-drawer
    hyprpaper
  ];

  # Link other related config directories to use existing configs
  home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "/home/micqdf/.config/waybar";
  home.file.".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "/home/micqdf/.config/rofi";

  # Enable services that work well with Hyprland
  services.dunst.enable = true;
  
  # XDG portal configuration for Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };
}