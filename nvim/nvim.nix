{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    # Basics
    globals.mapleader = " ";

    colorscheme = "catppuccin-mocha";

    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      which-key.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
      }
    ];
  };
}

