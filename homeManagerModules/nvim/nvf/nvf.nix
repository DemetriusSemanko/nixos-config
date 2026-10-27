{ pkgs, ... }: {
  programs.nvf = {
    enable = true;
    defaultEditor = true;
    settings = {
      vim = {
        lsp = {
          enable = true;
          formatOnSave = true;
          trouble.enable = true;
          otter-nvim.enable = true;
          nvim-docs-view.enable = true;
        };

        theme = {
          enable = true;
        }
        // import ./themes/catppuccin.nix;

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
          modes-nvim.enable = true;
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix = {
            enable = true;
            format.type = [ "nixfmt-rs" ];
          };

          bash.enable = true;
          just.enable = true;

          css = {
            enable = true;
            lsp.servers = [ "emmet-ls" ];
          };
          html = {
            enable = true;
            format.type = [ "prettier" ];
            lsp.servers = [ "emmet-ls" ];
          };
          typescript = {
            enable = true;
            lsp.servers = [ "emmet-ls" ];
          };
          astro = {
            enable = true;
            lsp.servers = [ "emmet-ls" ];
          };

          markdown = {
            enable = true;
            format.type = [ "rumdl" ];
            lsp.servers = [ "rumdl" ];
          };

          python = {
            enable = true;
            format.type = [ "ruff" ];
            lsp.servers = [ "ty" ];
          };

          rust = {
            enable = true;
            lsp.servers = [ "rust-analyzer" ];
            format.type = [ "rustfmt" ];
          };

          jinja.enable = true;

          lua.enable = true;

          typst.enable = true;
        };

        autocomplete.blink-cmp.enable = true;

        treesitter.indent.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        terminal.toggleterm = {
          enable = true;
        };

        utility = {
          ccc.enable = true;
          surround.enable = true;
          undotree.enable = true;
          yazi-nvim.enable = true;
          sleuth.enable = true;
        };

        visuals = {
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          rainbow-delimiters.enable = true;
          cinnamon-nvim.enable = true;
          highlight-undo.enable = true;
          cellular-automaton.enable = true;
        };

        comments.comment-nvim.enable = true;
        snippets.luasnip.enable = true;
        filetree.neo-tree.enable = true;
        statusline.lualine.enable = true;
        notify.nvim-notify.enable = true;
        telescope.enable = true;

        git.enable = true;

        opts.mouse = "";

        keymaps = [
          {
            key = "<leader><Tab>";
            mode = "n";
            action = ":Neotree toggle reveal<CR>";
          }
        ];
      };
    };
  };
}
