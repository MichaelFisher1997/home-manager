{ lib }:
let
  monitors = import ./monitors.nix;
  session = import ./session.nix;
  workspaces = import ./workspaces.nix;
  rules = import ./rules.nix;
in
  lib.recursiveUpdate monitors (lib.recursiveUpdate session (lib.recursiveUpdate workspaces rules))
