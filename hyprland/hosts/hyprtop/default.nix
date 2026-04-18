{ lib }:
let
  monitors = import ./monitors.nix;
  session = import ./session.nix;
  input = import ./input.nix;
  rules = import ./rules.nix;
in
  lib.recursiveUpdate monitors (lib.recursiveUpdate session (lib.recursiveUpdate input rules))
