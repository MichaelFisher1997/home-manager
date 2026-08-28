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
    # from stable: frozen upstreams, no newer release exists
    ++ (with pkgs; [
      zip
      unzip
      gzip
    ]);
}
