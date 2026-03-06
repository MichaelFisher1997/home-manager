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
      font = "HackGen Console NF 10";
      frame_color = "#e5809e";
      separator_color = "#323232";
      corner_radius = 16;
      gap_size = 8;
      padding = 12;
      horizontal_padding = 14;
      background = "#282828";
      foreground = "#f4d9e1";
      highlight = "#e6b9c6";
      timeout = 8;
      width = "(200, 400)";
      offset = "10x10";
    };

    urgency_low = {
      background = "#282828";
      foreground = "#928374";
      frame_color = "#323232";
      timeout = 4;
    };

    urgency_normal = {
      background = "#282828";
      foreground = "#f4d9e1";
      frame_color = "#e5809e";
      timeout = 8;
    };

    urgency_critical = {
      background = "#2a1a1a";
      foreground = "#f4d9e1";
      frame_color = "#db4b4b";
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

  # Override the adi1090x launcher's shared color/font files with our Waybar-matched palette
  xdg.configFile."rofi/colors/waybar.rasi" = {
    source = ../rofi/waybar.rasi;
    force = true;
  };

  xdg.configFile."rofi/launchers/type-1/shared/fonts.rasi" = {
    source = ../rofi/fonts.rasi;
    force = true;
  };

  xdg.configFile."rofi/launchers/type-1/shared/colors.rasi" = {
    text = ''
      @import "~/.config/rofi/colors/waybar.rasi"
    '';
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
