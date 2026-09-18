{ pkgs, unstable, ... }:

{
  home.packages =
    (with unstable; [
      fd
      fzf
      highlight
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
      jq
      bat
    ]);
}
