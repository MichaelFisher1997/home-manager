{ config, pkgs, lib, ... }:

{
  # Hyprland config is managed externally in ~/.config/hypr/hyprland.conf
  # This module only sets up related packages and services

  # Install Hyprland-related packages
  home.packages = with pkgs; [
    waypaper
    wl-clipboard
    blueman
    rofi
    waybar
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
    thunar-dropbox-plugin
    thunar-archive-plugin
    tumbler
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
    wlsunset  # For gamma/color temperature control
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
  ];

  # Enable services that work well with Hyprland
  services.dunst.enable = true;
  services.dunst.settings = {
    global = {
      font = "Noto Sans 10";
    };
  };

  # Start waybar via systemd for reliability
  systemd.user.services.waybar = {
    Unit = {
      Description = "Wayland bar for Hyprland";
      Documentation = "https://github.com/Alexays/Waybar/wiki";
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.waybar}/bin/waybar";
      Restart = "on-failure";
      RestartSec = 3;
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
