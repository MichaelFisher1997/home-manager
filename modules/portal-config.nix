{ config, pkgs, lib, ... }:

{
  # XDG portal configuration
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config.common.default = [ "hyprland" ];
    config.common."org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
  };
}
