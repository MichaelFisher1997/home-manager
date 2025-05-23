{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "lsd -l";
      # update = "sudo nixos-rebuild switch";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ ];
      theme = "agnoster";
    };
  };
}

