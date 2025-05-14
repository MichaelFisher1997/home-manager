{
  imports = [
    ./lsp.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
    enableMan = true;

    colorschemes = {
      tokyonight = {
        enable = true;
        settings = {
          style = "night"; # Other options: "storm", "day", "moon"
          transparent = true; # Optional: respects your `transparent_background`
          terminalColors = true; # Match terminal colors if you use a terminal emulator
          styles = {
            comments = { italic = true; };
            keywords = { italic = true; };
            functions = { bold = true; };
            variables = { }; # default
          };
        };
      };
    };

    plugins = {
      telescope.enable = true;
      treesitter.enable = true;
      lualine.enable = true;
      web-devicons.enable = true;
      transparent.enable = true;
      indent-blankline = {
        enable = true;
      };
    };
    clipboard = {
      providers = {
        wl-copy.enable = true; # For Wayland
        xsel.enable = true; # For X11
      };

      # Sync clipboard between OS and Neovim
      #  Remove this option if you want your OS clipboard to remain independent.
      register = "unnamedplus";
    };
    opts = {
      mouse = "a";
      number = true;
      undofile = true;
      breakindent = true;
      cursorline = true;
      scrolloff = 10;
      tabstop = 2;
      showtabline = 2;
      softtabstop = 2;
      swapfile = false;
      spell = true;
    };

    nixpkgs.useGlobalPackages = true;
    vimAlias = true;
    luaLoader.enable = true;
  };
}
