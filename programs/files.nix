{ pkgs, unstable, ... }:

{
  home.packages =
    # from unstable: newer releases than the stable channel carries
    (with unstable; [
      ranger
      _7zz
      unrar
      file-roller
      tree
    ])
    # from stable: office applications and file utilities
    ++ (with pkgs; [
      libreoffice-fresh
      onlyoffice-desktopeditors
      zip
      unzip
      gzip
    ]);
}
