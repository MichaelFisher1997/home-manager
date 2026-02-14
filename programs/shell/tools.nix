{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    kitty
    ghostty
    tmux
    unstable.zellij
    lsd
    lolcat
    tldr
    grc
    highlight
    nurl
    nixpkgs-fmt
    nixpkgs-review
    pay-respects
    jq
    fd
    fzf
    bat
  ];
}