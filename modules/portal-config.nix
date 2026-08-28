{ config, pkgs, lib, ... }:

{
  # XDG portal configuration
  # (hyprland portal comes from wayland.windowManager.hyprland.portalPackage)
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common.default = [ "hyprland" ];
    config.common."org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
  };
}
