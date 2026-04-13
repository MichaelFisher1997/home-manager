{ pkgs, ... }:

{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
    BUN_INSTALL = "$HOME/.bun";
    SHELL = "${pkgs.fish}/bin/fish";
    NPM_CONFIG_PREFIX = "$HOME/.npm-global";
    LIBVA_DRIVER_NAME = "radeonsi";
  };

  home.sessionPath = [
    "$HOME/.npm-global/bin"
    "$BUN_INSTALL/bin"
    "$HOME/go/bin"
  ];

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "zen-twilight.desktop" ];
    "x-scheme-handler/http" = [ "zen-twilight.desktop" ];
    "x-scheme-handler/https" = [ "zen-twilight.desktop" ];
    "x-scheme-handler/about" = [ "zen-twilight.desktop" ];
    "x-scheme-handler/unknown" = [ "zen-twilight.desktop" ];
    "application/zip" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-zip-compressed" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-tar" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-gtar" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-gzip" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-bzip2" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-xz" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-7z-compressed" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-rar-compressed" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-rar" = [ "org.gnome.FileRoller.desktop" ];
    "application/gzip" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-compressed-tar" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-bzip-compressed-tar" = [ "org.gnome.FileRoller.desktop" ];
    "application/x-xz-compressed-tar" = [ "org.gnome.FileRoller.desktop" ];
  };
}
