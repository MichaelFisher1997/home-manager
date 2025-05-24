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
          program = "zellij";
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
        normal = { family = "FiraCode Nerd Font"; style = "Regular"; };
        bold = { family = "FiraCode Nerd Font"; style = "Bold"; };
        italic = { family = "FiraCode Nerd Font"; style = "Italic"; };
        bold_italic = { family = "FiraCode Nerd Font"; style = "Bold Italic"; };
        fallback = [
          "Noto Color Emoji"
          "Symbols Nerd Font Mono"
        ];
      };

      general = {
        live_config_reload = true;
        working_directory = "None";
      };
    };
  };
}

