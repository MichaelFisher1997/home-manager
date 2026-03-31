{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };

      terminal = {
        shell = {
          program = "fish";
          args = [ "-c" "zellij" ];
        };
      };

      window = {
        padding = {
          x = 10;
          y = 10;
        };
        decorations = "Full";
        decorations_theme_variant = "Dark";
        opacity = 0.8;
      };

      colors.primary.background = "#000000";

      font = {
        size = 10.0;
        normal = { family = "Iosevka"; style = "Regular"; };
        bold = { family = "Iosevka"; style = "Bold"; };
        italic = { family = "Iosevka"; style = "Italic"; };
        bold_italic = { family = "Iosevka"; style = "Bold Italic"; };
      };

      general = {
        live_config_reload = true;
        working_directory = "None";
      };
    };
  };
}
