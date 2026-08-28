{ pkgs, unstable, ... }:

{
  home.packages =
    # 32-bit gaming libraries from unstable (newer mesa / vulkan / x11 stack)
    (with unstable.pkgsi686Linux; [
      vulkan-loader
      libGL
      libx11
      libxext
      libxfixes
      mesa
    ])
    ++ (with unstable; [
      wayland-protocols
    ]);
}
