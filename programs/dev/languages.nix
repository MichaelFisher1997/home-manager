{ pkgs, unstable, bun_1_4_0, ... }:

{
  home.packages =
    (with unstable; [
      air
      go
      golangci-lint
      golangci-lint-langserver
      hugo
      love
      lua5_4
      nodejs_24
      php
      phpPackages.composer
      poetry
      postcss
      python3
      ruby
      rustup
      tailwindcss_4
      templ
      zig
    ])
    ++ [
      bun_1_4_0
    ];
}
