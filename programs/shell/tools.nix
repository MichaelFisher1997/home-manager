{ pkgs, unstable, ... }:

{
  home.packages =
    (with unstable; [
      nurl
      nixfmt
      nixpkgs-review
      pay-respects
      tmux
      zellij
    ])
    ++ (with pkgs; [
      lsd
      lolcat
      tldr
      grc
      highlight
      jq
      fd
      fzf
      bat
    ]);
}