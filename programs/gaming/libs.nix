{ pkgs, pkgs_32, ... }:

{
  home.packages = with pkgs; [
    pkgs_32.vulkan-loader
    pkgs_32.libGL
    pkgs_32.libx11
    pkgs_32.libxext
    pkgs_32.libxfixes
    pkgs_32.mesa
    wayland-protocols
  ];
}