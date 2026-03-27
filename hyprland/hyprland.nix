{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

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

  # Waybar config - disabled in favor of eww (keeping for future use)
  # xdg.configFile."waybar/style.css" = {
  #   source = ../waybar/style.css;
  #   force = true;
  # };
  # 
  # xdg.configFile."waybar/config.jsonc" = {
  #   source = ../waybar/config.jsonc;
  #   force = true;
  # };

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

}
