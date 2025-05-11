{ config, pkgs, ... }:
{

  programs.fish = {
    enable = true;
    plugins = [
    { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
    {
      name = "fisher";
      src = pkgs.fetchFromGitHub {
        owner = "jorgebucaran";
        repo = "fisher";
        rev = "main";
        sha256 = "sha256-pR5RKU+zIb7CS0Y6vjx2QIZ8Iu/3ojRfAcAdjCOxl1U=";
      };
    }
    {
      name = "catppuccin";
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "fish";
        rev = "main";
        sha256 = "sha256-Oc0emnIUI4LV7QJLs4B2/FQtCFewRFVp7EDv8GawFsA=";

      };
    }
    ];
    shellAliases = {
      appLaunch = "/home/micqdf/.config/rofi/launchers/type-1/launcher.sh";
      hyperLoad = "$HOME/.local/share/hyprload/hyprload.sh";
      cl = "clear";
      kssh = "kitten ssh";
      hcat = "highlight";
      ls = "lsd -l";
      upgrade = "cd ~/.nix-config; nix flake update; sudo nixos-rebuild switch --flake .#hypr-nix";
      home-upgrade = "home-manager switch --flake ~/.config/home-manager/#micqdf";
    };
    interactiveShellInit = ''
      set fish_greeting ""
      fish_config theme choose "Catppuccin Mocha"
    '';
  };

  home.file = {
    ".config/fish/completions" = {
      source = ./completions;
      recursive = true;
    };
    ".config/fish/functions" = {
      source = ./functions;
      recursive = true;
    };
    ".config/fish/themes" = {
      source = ./themes;
      recursive = true;
    };
    ".config/fish/conf.d" = {
      source = ./conf.d;
      recursive = true;
    };
  };

}
