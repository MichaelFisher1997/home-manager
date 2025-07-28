{ pkgs, pkgs_32, unstable, ... }:

{
  home.packages = with pkgs; [

    #--------------- Communication ---------------#
    teams-for-linux
    discord
    webcord
    slack
    vesktop # A Vencord desktop client

    #--------------- Browsers ---------------#
    brave
    google-chrome
    firefox
    tor-browser
    kdePackages.falkon

    #--------------- Development ---------------#
    # Editors & IDEs
    sublime
    vscode
    kdePackages.kate

    # Dev Tools & Languages
    nixpacks
    clang-tools
    gcc
    cmake
    glew
    glfw
    sdl3
    vulkan-tools
    vulkan-headers
    python3
    php
    php83Packages.composer
    exercism
    bun
    air
    tailwindcss
    hashcat
    unstable.go
    unstable.golangci-lint
    unstable.golangci-lint-langserver
    unstable.hugo
    unstable.templ
    cargo
    zig
    lua
    love # LÖVE Potion - 2D game framework for Lua
    poetry

    # Version Control
    git
    git-lfs
    act
    nix-prefetch-git
    gh

    # Node/JS
    nodejs_20
    yarn
    nodePackages.tailwindcss
    nodePackages.postcss
    playwright

    #--------------- Shell & Terminal ---------------#
    kitty
    alacritty
    ghostty
    tmux
    zellij
    unstable.zellij
    lsd
    lolcat
    tldr
    grc
    highlight
    nurl
    nixpkgs-fmt
    nixpkgs-review
    pay-respects # A command-line tool to pay respects
    jq
    fd
    fzf
    bat

    #--------------- File Management ---------------#
    ranger
    _7zz
    unrar
    zip
    unzip
    gzip
    tree

    #--------------- System & Utilities ---------------#
    # System Monitors
    htop
    btop
    fastfetch

    # Utilities
    calc
    maim
    xclip
    xdotool
    pywal
    networkmanager_dmenu
    pika-backup
    rpi-imager
    sunshine # Gamestream host
    guacamole-client # Remote desktop gateway

    #--------------- Window Management & Theming ---------------#
    i3
    eww # Elkowars Wacky Widgets
    hyprsunset
    arandr
    nitrogen
    polybarFull
    picom
    catppuccin-kvantum
    themechanger

    #--------------- Multimedia ---------------#
    vlc
    simplescreenrecorder
    audacity
    haruna
    # davinci-resolve-studio # Disabled due to hash mismatch

    #--------------- Gaming ---------------#
    # Game Launchers & Tools
    steam-tui
    steamcmd
    mangohud
    protonup
    protontricks
    lutris
    bottles
    wine
    gamemode
    airshipper # Veloren launcher

    # 32-bit libraries for Steam/Wine
    pkgs_32.vulkan-loader
    pkgs_32.libGL
    pkgs_32.xorg.libX11
    pkgs_32.xorg.libXext
    pkgs_32.xorg.libXfixes
    pkgs_32.mesa
    wayland-protocols

    # Games
    # flightgear
    openttd
    endless-sky
    cataclysm-dda
    xonotic
    superTux
    superTuxKart
    mindustry-wayland
    speed_dreams
    simutrans_binaries
    nsnake

    #--------------- Fonts ---------------#
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-emoji
    twemoji-color-font
    nerd-fonts.fira-code


    #--------------- Personal & Notes ---------------#
    obsidian
    # megasync
    betterdiscord-installer
  ];
}
