{ config, pkgs, nixvim, ... } @ args:
let
  system = args.system or "x86_64-linux"; # fallback for non-flake
  unstable = import
    (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
      sha256 = "11qdsgrzaqmmwmll706q005dbfsfb0h1nhswc4pkldm0hxrlvcal";
    })
    {
      config.allowUnfree = true;
      system = system;
    };
in
{
  home.username = "micqdf";
  home.homeDirectory = "/home/micqdf";
  nixpkgs.config.allowUnfree = true;
  home.shell = pkgs.fish;

  # targets.genericLinux.enable = true;

  home.stateVersion = "25.05"; # Please read the comment before changing.
  imports = [
    nixvim.homeManagerModules.nixvim
    ./nvim/nixvim.nix
    ./fish/fish.nix
    # ./modules/gaming-config.nix
    ./modules/portal-config.nix
    ./zsh/zsh.nix
    ./alacritty/alacritty.nix
    ./obs/obs.nix
  ];


  home.packages = with pkgs; [
    # Editors & IDEs
    sublime
    vscode
    kdePackages.kate

    # Dev Tools & Languages
    clang-tools
    gcc
    cmake
    glew
    glfw
    libGL
    sdl3
    vulkan-loader
    vulkan-tools
    vulkan-headers
    wayland-protocols
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
    love
    poetry
    obsidian
    nodejs_20
    yarn
    nodePackages.tailwindcss
    nodePackages.postcss
    nodePackages.autoprefixer

    # Version Control
    git
    git-lfs
    nix-prefetch-git
    gh

    # Shell & Terminal
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
    pay-respects
    jq
    fd
    fzf
    bat

    # File Management
    ranger
    _7zz
    unrar
    zip
    unzip
    gzip
    tree
    lsd
    fd
    bat

    # System Monitors & Utilities (userland)
    htop
    btop
    fastfetch
    calc
    maim
    xclip
    xdotool
    pywal
    networkmanager_dmenu
    pika-backup

    # Window Management & Theming
    i3
    eww
    vesktop
    hyprsunset
    arandr
    nitrogen
    polybarFull
    picom
    catppuccin-kvantum
    themechanger

    # Browsers & GUI apps
    brave
    google-chrome
    firefox
    tor-browser
    kdePackages.falkon
    discord
    webcord
    slack
    vlc
    simplescreenrecorder
    audacity
    haruna
    davinci-resolve-studio
    obsidian

    # Games & Game tools
    mangohud
    protonup
    protontricks
    lutris
    bottles
    wine
    flightgear
    openttd
    endless-sky
    cataclysm-dda
    xonotic
    superTux
    superTuxKart
    airshipper
    mindustry-wayland
    speed_dreams
    simutrans_binaries
    nsnake

    # Fonts & Theme stuff
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-emoji
    twemoji-color-font
    nerd-fonts.fira-code
    catppuccin-kvantum
    themechanger

    # Backup, Notes, Personal
    pika-backup
    megasync
    obsidian
    betterdiscord-installer
    guacamole-client

    # Networking (userland)
    remmina
    ngrok
    tailscale
    rpi-imager

    # Misc & Personal
    betterdiscord-installer
    ghostty
    guacamole-client
    sunshine

    # AI
    unstable.windsurf

    # Node/JS
    nodejs_20
    yarn
    nodePackages.tailwindcss
    nodePackages.postcss
    nodePackages.autoprefixer


  ];


  home.sessionVariables = {
    EDITOR = "nvim";
    BUN_INSTALL = "$HOME/.bun";
  };

  programs.git = {
    enable = true;
    userName = "MichaelFisher1997";
    userEmail = "contact@michaelfisher.tech";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
  };

  #  xdg.mimeApps.defaultApplications = {
  #    "text/plain" = [ "neovide.desktop" ];
  #    "application/pds" = [ "zathura.desktop" ];
  #  };


  home.sessionPath = [
    "$BUN_INSTALL/bin"
    "$HOME/go/bin"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
