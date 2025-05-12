{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";

    colorschemes = {
      catppuccin = {
        enable = false;
        settings = {
        flavour = "mocha";
        integrations = {
          cmp = true;
          gitsigns = true;
          nvimtree = true;
          treesitter = true;
          notify = false;
          };
        };
      };
    };
    
    plugins = {
      telescope.enable = true;
      treesitter.enable = true;
      lualine.enable = true;
      web-devicons.enable = true; 
    };

    transparent.enable = true;
    nixpkgs.useGlobalPackages = true;
    vimAlias = true;
    luaLoader.enable = true;
  };
}

