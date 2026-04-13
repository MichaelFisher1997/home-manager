{ pkgs, lib, ... }:

{
  home.activation.playwright-install = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "$HOME/.cache/ms-playwright" ]; then
      echo "Installing Playwright browsers..."
      PATH=${pkgs.lib.makeBinPath [ pkgs.nodejs_24 ]}:$PATH ${pkgs.nodejs_24}/bin/npm exec playwright install
    else
      echo "Playwright browsers already installed, skipping."
    fi
  '';
}
