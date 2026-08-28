{ lib, vars, unstable, hyprland, ... }:

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
    ./files.nix
    ./packages.nix
    ./rofi.nix
  ];

  # upstream master build: carries the layer-surface pointer fix (PR #15899)
  # that restores slurp/hyprshot region-select dragging; switch back to
  # unstable.hyprland once 0.56.3+ is packaged
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland.packages.${vars.system}.hyprland;
    portalPackage = unstable.xdg-desktop-portal-hyprland;
    configType = "hyprlang";
    xwayland.enable = true;
    systemd.enable = true;
    settings = mergedHostSettings;
  };

}
