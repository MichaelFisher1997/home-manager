{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # LSP core support
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };
          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          gopls.enable = true;
          golangci_lint_ls.enable = true;
          lua_ls.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
          pylsp.enable = false; # disable one if both pyright/pylsp conflict
          tflint.enable = true;
          templ.enable = true;
          html.enable = true;
          htmx.enable = true;
          tailwindcss.enable = true;
          protols.enable = true;
        };
      };

      # Autocompletion
      cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          "nvim_lsp"
          "path"
          "buffer"
          "luasnip"
        ];
      };

      # Completion sources
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;

      # Snippets
      luasnip.enable = true;

      # Icons in completion menu
      lspkind.enable = true;
    };
  };
}

