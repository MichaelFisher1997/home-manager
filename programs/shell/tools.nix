{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    tmux
    unstable.zellij
    lsd
    lolcat
    tldr
    grc
    highlight
    nurl
    nixfmt-rfc-style
    nixpkgs-review
    pay-respects
    jq
    fd
    fzf
    bat
  ];
}