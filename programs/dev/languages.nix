{ pkgs, unstable, bun_1_4_0, ... }:

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
    phpPackages.composer
    bun_1_4_0
    air
    tailwindcss
    unstable.go
    unstable.golangci-lint
    unstable.golangci-lint-langserver
    unstable.hugo
    unstable.templ
    unstable.rustup
    zig
    lua
    love
    poetry
    ruby
    nodejs_24
    nodePackages.postcss
  ];
}