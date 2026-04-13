{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      background = "#0a0a0a";
      background-opacity = 0.95;
      font-family = "Iosevka";
      font-size = 10.0;
      gtk-titlebar = true;
      gtk-titlebar-style = "tabs";
      window-decoration = "client";
      window-show-tab-bar = "always";
      window-padding-x = 10;
      window-padding-y = 10;
      command = "${pkgs.fish}/bin/fish";
      "keybind" = "ctrl+shift+r=reload_config";
    };
  };
}
