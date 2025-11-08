{ pkgs, pkgs_32, unstable, cursor-flake, windsurf-flake, ... }:

{
  home.packages = with pkgs; [
    #--------------- Music ---------------#
    unstable.famistudio
    # unstable.renoise # Temporarily disabled due to libX11 conflict

    #--------------- Crypto ---------------#
		anchor
		foundry

    #--------------- Communication ---------------#
    teams-for-linux
    discord
    webcord
    slack
    vesktop # A Vencord desktop client

    #--------------- Browsers ---------------#
    brave
    google-chrome
    chromium
    firefox
    tor-browser
    kdePackages.falkon

    #--------------- Development ---------------#
    # Editors & IDEs
    sublime
    vscode
    kdePackages.kate
		flatpak-builder
		gnumake
		unstable.stripe-cli
		unstable.doppler
		libsecret
		unstable.backblaze-b2
		uv
		unstable.goose-cli
		git-credential-manager
		wrangler
		# unstable.opencode

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
		unstable.supabase-cli
		ffmpeg
		libavif 
		imagemagick
		ruby
		whois
		mpv

    # Version Control
    git
    git-lfs
    act
    nix-prefetch-git
    gh

    # Node/JS
    nodejs_24
    yarn
    nodePackages.tailwindcss
    nodePackages.postcss
    playwright

    #--------------- Shell & Terminal ---------------#
    kitty
    alacritty
    ghostty
    tmux
    unstable.zellij  # Use only unstable version to avoid collision
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
    # rpi-imager # Temporarily disabled due to build failure
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
    # audacity # Temporarily disabled due to build failure
    haruna
    # davinci-resolve-studio # Disabled due to hash mismatch

    #--------------- Gaming ---------------#
    # Game Launchers & Tools
     steam-tui
     steamcmd
     protonup-ng
    protontricks
    lutris
    bottles
    wine
    gamemode
    airshipper # Veloren launcher
    antimicrox # Gamepad to keyboard mapping
    # jstest-gtk # Joystick testing tool - disabled due to CMake version issue
		unstable.pcsx2
		unstable.rpcs3
		unstable.xenia-canary
		# shadps4 # Disabled due to shiboken2 CMake version issue

    #--------------- Gaming - Dev ---------------#
		tiled

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
    # superTuxKart
    mindustry-wayland
    # speed_dreams # Temporarily disabled due to build failure
    simutrans_binaries
    nsnake
    ryubing

    #--------------- Fonts ---------------#
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    nerd-fonts.fira-code


    #--------------- Personal & Notes ---------------#
    obsidian
    # megasync
    betterdiscord-installer
    #--------------- AI - CLI - MCP    ---------------#
		unstable.claude-code
		cursor-flake.packages.x86_64-linux.default
		windsurf-flake.packages.x86_64-linux.default
		unstable.zed-editor


  ];
}
