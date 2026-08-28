{ pkgs, unstable, lib, vars, ... }:
let
  isLaptop = vars.hostName == "hyprtop";
in {
  home.packages =
    # from unstable: hyprwm family coherence + newer releases
    (with unstable; [
      hyprpaper
      hyprlock
      hyprshot
      hyprsunset
      awww
      swaybg
      waypaper
      wttrbar
      nwg-look
      nwg-drawer
      udiskie
      pavucontrol
      catppuccin-kvantum
      thunar-volman
      thunar-dropbox-plugin
      thunar-archive-plugin
      tumbler
    ])
    # from stable: already at the newest upstream release
    ++ (with pkgs; [
      wl-clipboard
      blueman
      networkmanagerapplet
      rofi
      hackgen-nf-font
      playerctl
      wlr-randr
      libcanberra-gtk3
      pamixer
      grim
      discocss
    ])
    ++ lib.optionals isLaptop [
      unstable.hypridle
    ];
}
