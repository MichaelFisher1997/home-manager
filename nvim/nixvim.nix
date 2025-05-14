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
      catppuccin = {
        enable = true;
        settings = {
          background = {
            light = "mocha";
            dark = "mocha";
          };
          custom_highlights = ''
            function(highlights)
              return {
              CursorLineNr = { fg = highlights.green, style = {} },
              NavicText = { fg = highlights.text },
              }
            end
          '';
          flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
          no_bold = false;
          no_italic = false;
          no_underline = false;
          transparent_background = true;
          integrations = {
            cmp = true;
            notify = true;
            gitsigns = true;
            neotree = true;
            which_key = true;
            illuminate = {
              enabled = true;
              lsp = true;
            };
            navic = {
              enabled = true;
              custom_bg = "NONE";
            };
            treesitter = {
              enable = true;
              ensureInstalled = [ "lua" "nix" "go" "html" "json" "yaml" "bash" "python" "terraform" ]; # etc.
              indent = true;
              highlight = true;
            };

            telescope.enabled = true;
            indent_blankline.enabled = true;
            mini = {
              enabled = true;
              indentscope_color = "rosewater";
            };
            native_lsp = {
              enabled = true;
              inlay_hints = {
                background = true;
              };
              virtual_text = {
                errors = [ "italic" ];
                hints = [ "italic" ];
                information = [ "italic" ];
                warnings = [ "italic" ];
                ok = [ "italic" ];
              };
              underlines = {
                errors = [ "underline" ];
                hints = [ "underline" ];
                information = [ "underline" ];
                warnings = [ "underline" ];
              };
            };
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

#colorschemes = {
#  catppuccin = {
#    enable = false;
#    settings = {
#      flavour = "mocha";
#      integrations = {
#        cmp = true;
#        gitsigns = true;
#        nvimtree = true;
#        treesitter = true;
#        notify = false;
#      };
#    };
#    transparent_background = true;
#  };
#};
