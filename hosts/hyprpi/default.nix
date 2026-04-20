{ pkgs, vars, ... }:
{
  home.username = vars.user.name;
  home.homeDirectory = vars.user.homeDirectory;
  home.stateVersion = vars.stateVersion;

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  imports = [
    ../../fish/fish.nix
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "MichaelFisher1997";
      email = "contact@michaelfisher.tech";
    };
  };

  home.sessionVariables = {
    SHELL = "${pkgs.fish}/bin/fish";
  };

  home.packages = with pkgs; [
    git
    htop
    curl
    wget
    tmux
    ripgrep
    fd
    tree
    rsync
  ];
}
