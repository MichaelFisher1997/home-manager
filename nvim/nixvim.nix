{ config, pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
    enableMan = true;

    colorschemes = {
      tokyonight = {
        enable = true;
        settings = {
          style = "night";
          transparent = true;
          terminalColors = true;
          styles = {
            comments = { italic = true; };
            keywords = { italic = true; };
            functions = { bold = true; };
            variables = { };
          };
        };
      };
    };

    plugins = {
      telescope.enable = true;
      treesitter.enable = true;
      lualine.enable = false;
      web-devicons.enable = true;
      transparent.enable = true;
      indent-blankline.enable = true;

      # Emoji completion support
      cmp = {
        enable = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "path"; }
          { name = "emoji"; }
        ];
      };
      cmp-emoji.enable = true;
    };

    clipboard = {
      providers = {
        wl-copy.enable = true;
        xsel.enable = true;
      };
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
