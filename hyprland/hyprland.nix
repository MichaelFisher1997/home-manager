{ config, pkgs, lib, vars, ... }:

let
  isLaptop = vars.hostName == "hyprtop";
  sharedSettings = import ./shared { inherit vars; };
  hostSettings = if isLaptop then import ./hosts/hyprtop { inherit lib; } else import ./hosts/hypr-nix { inherit lib; };
  hyprLib = import ./lib.nix { inherit lib; };
  mergedHostSettings = hyprLib.mergeHyprSettings sharedSettings hostSettings;
in {
  imports = [
    ./dunst.nix
    ./waybar.nix
    ./eww-snapshot.nix
  ];

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
