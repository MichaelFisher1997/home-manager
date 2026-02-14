{ pkgs, unstable, cursor-flake, windsurf-flake, opencode-desktop-flake, ... }:

{
  home.packages = with pkgs; [
    sublime
    vscode
    kdePackages.kate
    unstable.zed-editor
    cursor-flake.packages.x86_64-linux.default
    windsurf-flake.packages.x86_64-linux.default
    opencode-desktop-flake.packages.x86_64-linux.default
  ];
}