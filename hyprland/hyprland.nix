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
      frame_color = "#4c566a";
      separator_color = "#3b4252";
      corner_radius = 10;
      gap_size = 8;
      padding = 12;
      horizontal_padding = 12;
      background = "#1f2329";
      foreground = "#eceff4";
      highlight = "#88c0d0";
      timeout = 8;
    };

    urgency_low = {
      background = "#1f2329";
      foreground = "#d8dee9";
      frame_color = "#4c566a";
      timeout = 4;
    };

    urgency_normal = {
      background = "#1f2329";
      foreground = "#eceff4";
      frame_color = "#88c0d0";
      timeout = 8;
    };

    urgency_critical = {
      background = "#2b1f23";
      foreground = "#eceff4";
      frame_color = "#bf616a";
      timeout = 0;
    };
  };

  xdg.configFile."waybar/style.css" = {
    source = ../waybar/style.css;
    force = true;
  };

  xdg.configFile."rofi/config.rasi" = {
    source = ../rofi/config.rasi;
    force = true;
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
      ExecReload = "${pkgs.procps}/bin/pkill -x waybar; ${pkgs.waybar}/bin/waybar";
      Restart = "on-failure";
      RestartSec = 3;
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
