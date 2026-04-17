{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    gcc
    clang-tools
    cmake
    glew
    glfw
    sdl3
    vulkan-tools
    vulkan-headers
    python3
    php
    php83Packages.composer
    bun
    air
    tailwindcss
    unstable.go
    unstable.golangci-lint
    unstable.golangci-lint-langserver
    unstable.hugo
    unstable.templ
    cargo
    zig
    lua
    love
    poetry
    ruby
    nodejs_24
    nodePackages.postcss
  ];
}