{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.autoLoad = true;
    plugins.lspconfig.enable = true;
    plugins.treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
      };
    };
    lsp = {
      servers.ruff.enable = true; # Python
      servers.rust_analyzer.enable = true; # Rust
      servers.tinymist.enable = true;
      servers.html.enable = true;
      servers.typos_lsp.enable = true; # Language typos
      servers.emmet_language_server.enable = true; # Emmet
    };
    plugins.lspsaga.enable = true;
    plugins.web-devicons.enable = true;
    plugins.dropbar.enable = true;
    plugins.guess-indent.enable = true;
    plugins.conform-nvim = {
      enable = true;
      autoInstall.enable = true;
      settings.formatters_by_ft = {
        nix = [ "nixfmt" ];
        python = [ "ruff_format" ];
        rust = [ "rustfmt" ];
        typst = [ "typstyle" ];
        html = [ "prettier" ];
        typescriptreact = [ "oxfmt" ];
        lua = [ "stylua" ];
        css = [ "prettier" ];
        java = [ "google-java-format" ];
        astro = [ "deno_fmt" ];
        markdown = [ "deno_fmt" ];
      };
      luaConfig.post = ''
        vim.api.nvim_create_user_command("Format", function(args)
          local range = nil
          if args.count ~= -1 then
            local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
            range = {
              start = { args.line1, 0 },
              ["end"] = { args.line2, end_line:len() },
            }
          end
          require("conform").format({ async = true, lsp_format = "fallback", range = range })
        end, { range = true })
      '';
    };
    plugins.cmp = {
      enable = true;
      autoEnableSources = true; # Scans the settings.sources array, enabling if available
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "spell"; }
        ];

        mapping = {
          "<Tab>" = "cmp.mapping.confirm({ select = true })";
          "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };
    };
    plugins.toggleterm = {
      enable = true;
      settings.open_mapping = "[[<C-\\>]]";
    };
  };

}
