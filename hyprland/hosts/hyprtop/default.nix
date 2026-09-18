{ lib }:
let
  monitors = import ./monitors.nix;
  session = import ./session.nix { inherit lib; };
  input = import ./input.nix { inherit lib; };
  rules = import ./rules.nix;
in
  lib.recursiveUpdate monitors (lib.recursiveUpdate session (lib.recursiveUpdate input rules))
