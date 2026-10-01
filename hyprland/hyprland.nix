{ lib, vars, unstable, ... }:

let
  isLaptop = vars.hostName == "hyprtop";
  sharedSettings = import ./shared { inherit lib vars; };
  hostSettings = if isLaptop then import ./hosts/hyprtop { inherit lib; } else import ./hosts/hypr-nix { inherit lib; };
  hyprLib = import ./lib.nix { inherit lib; };
  mergedHostSettings = hyprLib.mergeHyprSettings sharedSettings hostSettings;
in {
  imports = [
    ./dunst.nix
    ./quickshell.nix
    ./eww-snapshot.nix
    ./files.nix
    ./packages.nix
    ./rofi.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = unstable.hyprland;
    portalPackage = unstable.xdg-desktop-portal-hyprland;
    configType = "lua";
    xwayland.enable = true;
    systemd.enable = true;
    settings = mergedHostSettings;
  };

}
