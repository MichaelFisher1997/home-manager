{ config, pkgs, ... }:

{
  home.username = "micqdf";
  home.homeDirectory = "/home/micqdf";

  # targets.genericLinux.enable = true;

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    neovide
    zathura
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BUN_INSTALL = "$HOME/.bun";
  };

  home.file = {
    ".config/fish/completions" = {
      source = ./fish/completions;
      recursive = true;
    };
    ".config/fish/functions" = {
      source = ./fish/functions;
      recursive = true;
    };
    ".config/fish/themes" = {
      source = ./fish/themes;
      recursive = true;
    };
    ".config/fish/conf.d" = {
      source = ./fish/conf.d;
      recursive = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "MichaelFisher1997";
    userEmail = "contact@michaelfisher.tech";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "neovide.desktop" ];
    "application/pds" = [ "zathura.desktop" ];
  };

  programs.fish = {
    enable = true;
    plugins = [
    {
      name = "fisher";
      src = pkgs.fetchFromGitHub {
        owner = "jorgebucaran";
        repo = "fisher";
        rev = "4.4.4";
        sha256 = "sha256-..."; # replace with actual hash
      };
    }
    {
      name = "fzf.fish";
      src = pkgs.fetchFromGitHub {
        owner = "patrickf1";
        repo = "fzf.fish";
        rev = "some-tag-or-commit";
        sha256 = "sha256-...";
      };
    }
    {
      name = "catppuccin";
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "fish";
        rev = "main";
        sha256 = "sha256-...";
      };
    }
    ];
    shellAliases = {
      appLaunch = "/home/micqdf/.config/rofi/launchers/type-1/launcher.sh";
      hyperLoad = "$HOME/.local/share/hyprload/hyprload.sh";
      home = "cd $HOME";
      vfish = "nvim $HOME/.config/fish/config.fish";
      cdfish = "cd $HOME/.config/fish/";
      cl = "clear";
      kssh = "kitten ssh";
      golangci-lint = "/home/micqdf/go/bin/golangci-lint";
      hcat = "highlight";
      ls = "lsd -l";
      ddevpull = "~/.tools/ddevpull";
      behat = "set -l CURRENT_DIR (pwd); docker run --rm -v $CURRENT_DIR:/src docksal/behat --colors (string join ' ' \$argv)";
      upgrade = "cd ~/.nix-config; nix flake update; sudo nixos-rebuild switch --flake .#hypr-nix";
      home-upgrade = "home-manager switch --flake ~/.config/home-manager/#micqdf";
    };
    interactiveShellInit = ''
      set fish_greeting ""
    '';
  };

  home.sessionPath = [
    "$BUN_INSTALL/bin"
    "$HOME/go/bin"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}  

