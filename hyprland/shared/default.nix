{ vars }:
let
  programs = import ./programs.nix;
  session = import ./session.nix;
  appearance = import ./appearance.nix;
  input = import ./input.nix;
  binds = import ./binds.nix { inherit vars; };
in
  programs // session // appearance // input // binds
