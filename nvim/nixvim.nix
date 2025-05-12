{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorscheme = "catppuccin-mocha";
    globals.mapleader = " ";

    plugins = {
      telescope.enable = true;
      treesitter.enable = true;
      lualine.enable = true;
      web-devicons.enable = true; 
    };
    plugins.catppuccin = {
  	  enable = true;
  	  flavour = "mocha";
  	};


    nixpkgs.useGlobalPackages = true;
    vimAlias = true;
    luaLoader.enable = true;
  };
}

