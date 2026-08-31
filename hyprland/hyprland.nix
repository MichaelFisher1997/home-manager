{ lib, vars, unstable, pkgs, ... }:

let
  isLaptop = vars.hostName == "hyprtop";
  sharedSettings = import ./shared { inherit vars; };
  hostSettings = if isLaptop then import ./hosts/hyprtop { inherit lib; } else import ./hosts/hypr-nix { inherit lib; };
  hyprLib = import ./lib.nix { inherit lib; };
  mergedHostSettings = hyprLib.mergeHyprSettings sharedSettings hostSettings;
  patchedHyprland = unstable.hyprland.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      (pkgs.fetchpatch {
        url = "https://github.com/hyprwm/Hyprland/commit/6c5b5d09ee9c1b02ac154c70f1fc4cfa8a787e3d.patch";
        hash = "sha256-JftO7kefREbbn356778cMBaGHr/g8YgQ/YzdWuKS+c8=";
      })
    ];
  });
in {
  imports = [
    ./dunst.nix
    ./waybar.nix
    ./eww-snapshot.nix
    ./files.nix
    ./packages.nix
    ./rofi.nix
  ];

  # Backport the layer-surface pointer-focus fix from PR #15899 until it is
  # included in a stable Hyprland release.
  wayland.windowManager.hyprland = {
    enable = true;
    package = patchedHyprland;
    portalPackage = unstable.xdg-desktop-portal-hyprland;
    configType = "hyprlang";
    xwayland.enable = true;
    systemd.enable = true;
    settings = mergedHostSettings;
  };

}
