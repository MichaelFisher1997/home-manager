{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ranger
    _7zz
    unrar
    zip
    unzip
    gzip
    tree
  ];
}