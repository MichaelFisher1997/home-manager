{ config, pkgs, lib, vars, ... }:

let
  isLaptop = vars.hostName == "hyprtop";
  ewwConfigDir = "${config.xdg.configHome}/eww";
  sharedSettings = import ./shared { inherit vars; };
  hostSettings = if isLaptop then import ./hosts/hyprtop { inherit lib; } else import ./hosts/hypr-nix { inherit lib; };
  hyprLib = import ./lib.nix { inherit lib; };
  ewwYuckText = lib.replaceStrings
    [
      "./scripts/"
      "\"scripts/"
      "images/"
    ]
    [
      "${ewwConfigDir}/scripts/"
      "\"${ewwConfigDir}/scripts/"
      "${ewwConfigDir}/images/"
    ]
    (builtins.readFile ../eww/eww.yuck);
  ewwScssText = lib.replaceStrings
    [ "images/" ]
    [ "${ewwConfigDir}/images/" ]
    (builtins.readFile ../eww/eww.scss);
  mergedHostSettings = hyprLib.mergeHyprSettings sharedSettings hostSettings;
in {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = mergedHostSettings;
  };

  # Install Hyprland-related packages
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
    dunst
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
    waybar
  ] ++ lib.optionals isLaptop [
    hypridle
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

  xdg.configFile."waybar/config.jsonc" = {
    text = lib.replaceStrings
      [ "@MODULES_LEFT@" ]
      [
        (if isLaptop then
          ''["custom/launcher", "hyprland/workspaces", "backlight", "battery", "custom/playerctl", "custom/playerlabel"]''
        else
          ''["custom/launcher", "hyprland/workspaces", "custom/playerctl", "custom/playerlabel"]'')
      ]
      (builtins.readFile ../waybar/config.jsonc);
    force = true;
  };

  xdg.configFile."rofi/config.rasi" = {
    source = ../rofi/config.rasi;
    force = true;
  };

  xdg.configFile."hypr/wallpaper.jpg" = {
    source = ./wallpaper.jpg;
    force = true;
  };

  xdg.configFile."hypr/hyprlock.conf" = {
    source = ./hyprlock.conf;
    force = true;
  };

  xdg.configFile."hypr/hypridle.conf" = lib.mkIf isLaptop {
    source = ./hypridle.conf;
    force = true;
  };

  xdg.configFile."eww/eww.scss" = lib.mkIf isLaptop {
    text = ewwScssText;
    force = true;
  };

  xdg.configFile."eww/launch_bar" = lib.mkIf isLaptop {
    source = ../eww/launch_bar;
    force = true;
  };

  xdg.configFile."eww/scripts" = lib.mkIf isLaptop {
    source = ../eww/scripts;
    recursive = true;
    force = true;
  };

  xdg.configFile."eww/images" = lib.mkIf isLaptop {
    source = ../eww/images;
    recursive = true;
    force = true;
  };

  xdg.configFile."eww/eww.yuck" = lib.mkIf isLaptop {
    text = ewwYuckText;
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
