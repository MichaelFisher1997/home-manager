{ config, pkgs, ... }:

let
  hostname = let h = builtins.getEnv "HOSTNAME"; in if h == null then "" else h;
in {
  xdg.portal = {
    enable = true;

    extraPortals =
      if hostname == "hypr-nix" then [ pkgs.xdg-desktop-portal-hyprland ]
      else if hostname == "mike" then [ pkgs.xdg-desktop-portal-kde ]
      else [ pkgs.xdg-desktop-portal-gtk ];

    config = {
      common.default = "*";  # fallback to default like old versions
    };
  };
}

