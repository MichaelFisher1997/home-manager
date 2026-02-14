{ pkgs, lib, ... }:

{
  home.activation.playwright-install = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "Installing Playwright browsers..."
    PATH=${pkgs.lib.makeBinPath [ pkgs.nodejs_24 ]}:$PATH ${pkgs.nodejs_24}/bin/npm exec playwright install
  '';
}