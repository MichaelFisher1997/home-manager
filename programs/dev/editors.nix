{ pkgs, unstable, windsurf-flake, opencode-desktop-flake, ... }:

{
  home.packages = with pkgs; [
    sublime
    vscode
    unstable.zed-editor
    windsurf-flake.packages.x86_64-linux.default
    opencode-desktop-flake.packages.x86_64-linux.default
  ];
}
