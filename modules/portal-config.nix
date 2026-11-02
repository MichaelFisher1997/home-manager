{ config, pkgs, lib, unstable, ... }:

{
  # XDG portal configuration
  # The Hyprland portal is added directly because it no longer accepts a Hyprland override.
  xdg.portal = {
    # The Hyprland module disables portals when its portalPackage is null.
    enable = lib.mkForce true;
    extraPortals = with pkgs; [
      unstable.xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config.common.default = [ "hyprland" ];
    config.common."org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
  };
}
