{ pkgs, ... }:

{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
    BUN_INSTALL = "$HOME/.bun";
    SHELL = "${pkgs.fish}/bin/fish";
    NPM_CONFIG_PREFIX = "$HOME/.npm-global";
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
  };
}
