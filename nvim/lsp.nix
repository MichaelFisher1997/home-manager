{ pkgs, ... }:

{
  programs.nixvim = {
    opts.completeopt = [ "menu" "menuone" "noselect" ];

    plugins = {
      # Core LSP
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
          tflint.enable = true;
          templ.enable = true;
          html.enable = true;
          htmx.enable = true;
          tailwindcss.enable = true;
          protols.enable = true;
        };
      };
      lsp.onAttach = ''
	  vim.api.nvim_create_autocmd("CursorHold", {
	    buffer = 0,
	    callback = function()
	      vim.diagnostic.open_float(nil, { focusable = false })
	    end,
	  })
	'';


      # Snippets
      luasnip.enable = true;

      # Completion plugins
      cmp.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;

      # Completion UI (with icons)
      lspkind = {
        enable = true;
        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            path = "[path]";
            buffer = "[buf]";
            luasnip = "[snip]";
          };
        };
      };

      # CMP configuration
      cmp.settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
        ];
      };
    };
  };
}

