{ config, lib, ... }:

let
  hostname = builtins.getEnv "HOSTNAME";
in {
  xdg.portal = {
    enable = true;
    extraPortals = if hostname == "hypr-nix" then [ "xdg-desktop-portal-hyprland" ]
                   else if hostname == "mike" then [ "xdg-desktop-portal-kde" ]
                   else [ "xdg-desktop-portal-gtk" ];
  };
}

