{ config, pkgs, vars, ... }:
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
          rev = "791da644d33d392216f6b1a9b5fc1e470db6d7f2";
          sha256 = "185nzkbnsgrmq9pj1llmw6a6w29sbb656r4imkbv2qksdvr9sp2k";
        };
      }
      {
        name = "catppuccin";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "fish";
          rev = "5fc5ae9c2ec22eb376cb03ce76f0d262a38960f3";
          sha256 = "19qd700wj0h7k68fs27qa1b1qzs8ccd8rw6qpml3ccyffxhmd8yw";
        };
      }
    ];
    shellAliases = {
      cl = "clear";
      hcat = "highlight";
      ls = "lsd -l";
      syscfg = "cd $HOME/nixos/nix-config";
      homecfg = "cd $HOME/nixos/home-manager";
      upgrade = "cd $HOME/nixos/nix-config; sudo nixos-rebuild switch --flake path:$HOME/nixos/nix-config#${vars.hostName}";
      upgrade-update = "cd $HOME/nixos/nix-config; nix flake update; sudo nixos-rebuild switch --flake path:$HOME/nixos/nix-config#${vars.hostName}";
      home-upgrade = "home-manager switch --flake path:$HOME/nixos/home-manager#${vars.hostName}";
    };
    interactiveShellInit = ''
      set fish_greeting ""
      fish_config theme choose "Catppuccin Mocha"
      
      # Solana environment variables
      set -gx SOLANA_INSTALL_INIT_SKIP_PATH_CHECK 1
      set -gx SOLANA_HOME "$HOME/.local/share/solana"
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
