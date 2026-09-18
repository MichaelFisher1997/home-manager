{ lib, vars }:
let
  programs = import ./programs.nix;
  session = import ./session.nix { inherit lib; };
  appearance = import ./appearance.nix;
  input = import ./input.nix;
  binds = import ./binds.nix { inherit lib vars; };
in
  lib.foldl' lib.recursiveUpdate { } [ programs session appearance input binds ]
