{ config, pkgs, lib, hyprland, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
    systemd.enable = false;  # Disable to avoid config conflicts
    
    # Use extraConfig to include existing config without managing the file
    extraConfig = ''
      # Config is managed externally in ~/.config/hypr/hyprland.conf
    '';
  };

  # Install Hyprland-related packages
  home.packages = with pkgs; [
    waypaper
    wl-clipboard
    blueman
    rofi-wayland
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
  ];

  # Enable services that work well with Hyprland
  services.dunst.enable = true;
}