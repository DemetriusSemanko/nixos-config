{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  home.stateVersion = "26.05";

  programs.bash.enable = true;

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      search = {
        force = true;
        engines =
          let
            mkEngineForceFavicon = aliases: queryUrl: iconUrl: {
              definedAliases = aliases;
              icon = iconUrl;
              urls = [ { template = queryUrl; } ];
            };
            mkEngine =
              aliases: queryUrl: iconExt:
              (mkEngineForceFavicon aliases queryUrl (
                let
                  noPath = lib.strings.concatStrings (
                    lib.strings.intersperse "/" (lib.lists.take 3 (lib.strings.splitString "/" queryUrl))
                  );
                in
                "${noPath}/favicon.${iconExt}"
              ));
            mkModrinth =
              aliases: type: mkEngine aliases "https://modrinth.com/discover/${type}?q={searchTerms}" "ico";
          in
          {
            # Dev
            "GitHub Repos" =
              mkEngineForceFavicon [ "@gh" "@github" ]
                "https://github.com/search?type=repositories&q={searchTerms}"
                "https://github.githubassets.com/favicons/favicon-dark.svg";
            "SourceGraph" = mkEngine [
              "@sg"
              "@sourcegraph"
            ] "https://sourcegraph.com/search?q={searchTerms}" "png";

            ## Web
            "MDN Web Docs" = mkEngine [
              "@mdn"
            ] "https://developer.mozilla.org/en-US/search?q={searchTerms}" "ico";
            "Can I Use" = mkEngineForceFavicon [
              "@ciu"
              "@baseline"
            ] "https://caniuse.com/?search={searchTerms}" "https://caniuse.com/img/favicon-128.png";
            "NPM" = mkEngine [ "@npm" ] "https://www.npmx.dev/search?q={searchTerms}" "ico";
            "Iconify" = mkEngine [
              "@iconify"
              "@icons"
            ] "https://icon-sets.iconify.design/?query={searchTerms}" "ico";
            "Astro" = mkEngineForceFavicon [
              "@astro"
            ] "https://a.stro.cc/{searchTerms}" "https://docs.astro.build/favicon.svg";
            "Porkbun" = mkEngine [ "@porkbun" ] "https://porkbun.com/checkout/search?q={searchTerms}" "ico";
            "Http.Cat" = mkEngine [ "@cat" "@hcat" "@httpcat" ] "https://http.cat/{searchTerms}" "ico";

            ## Rust
            "Crates.io" = mkEngine [
              "@crates"
              "@cratesio"
              "@cargo"
            ] "https://crates.io/search?q={searchTerms}" "ico";
            "Rust Docs" =
              mkEngineForceFavicon [ "@rust" "@rustdocs" "@ruststd" ]
                "https://doc.rust-lang.org/std/index.html?search={searchTerms}"
                "https://doc.rust-lang.org/static.files/favicon-2c020d218678b618.svg";
            "Docsrs" = mkEngine [ "@docsrs" ] "https://docs.rs/releases/search?query={searchTerms}" "ico";

            ## Python
            "PyPI" = mkEngineForceFavicon [
              "@pypi"
              "@pip"
            ] "https://pypi.org/search/?q={searchTerms}" "https://pypi.org/static/images/favicon.35549fe8.ico";

            ## .NET
            "NuGet" = mkEngine [ "@nuget" ] "https://www.nuget.org/packages?q={searchTerms}" "ico";

            ## Linux Stuff
            "Kernel Docs" = mkEngine [
              "@lnx"
              "@linux"
              "@kernel"
            ] "https://www.kernel.org/doc/html/latest/search.html?q={searchTerms}" "ico";
            "Arch Wiki" = mkEngine [
              "@aw"
              "@arch"
            ] "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={searchTerms}" "ico";
            "Nerd Fonts" =
              mkEngineForceFavicon [ "@nf" "@nerdfonts" ] "https://www.nerdfonts.com/cheat-sheet?q={searchTerms}"
                "https://www.nerdfonts.com/assets/img/favicon.ico";

            ### Haskell
            "Hoogle Base" = mkEngine [
              "@h"
              "@hoogle"
            ] "https://hoogle.haskell.org/?scope=package%3Abase&hoogle={searchTerms}" "png";
            "Hoogle All" = mkEngine [
              "@ha"
              "@hoogall"
            ] "https://hoogle.haskell.org/?hoogle={searchTerms}" "png";

            ### Nix
            "Nix Packages" = mkEngine [
              "@nixpkgs"
            ] "https://search.nixos.org/packages?channel=unstable&size=500&query={searchTerms}" "png";
            "NixOS Options" = mkEngine [
              "@nixos"
            ] "https://search.nixos.org/options?channel=unstable&size=500&query={searchTerms}" "png";
            "NixOS Wiki" = mkEngine [ "@nixwiki" ] "https://nixos.wiki/index.php?search={searchTerms}" "png";
            "Home Manager Options" =
              mkEngineForceFavicon [ "@hm" ]
                "https://home-manager-options.extranix.com/?release=master&query={searchTerms}"
                "https://home-manager-options.extranix.com/images/favicon.png";
            "Noogle" = mkEngine [
              "@noogle"
              "@nixlib"
            ] "https://noogle.dev/q?limit=100&term={searchTerms}" "png";
            "SourceGraph Nix" =
              mkEngine [ "@sgn" "@yoink" ]
                "https://sourcegraph.com/search?q=lang:Nix+-repo:NixOS/*+-repo:nix-community/*+{searchTerms}"
                "png";
            "Nixpkgs Issues" =
              mkEngineForceFavicon [ "@nixissues" ]
                "https://github.com/NixOS/nixpkgs/issues?q=sort%3Aupdated-desc+is%3Aissue+is%3Aopen+{searchTerms}"
                "https://github.githubassets.com/favicons/favicon-dark.svg";
            "NixVim Options" =
              mkEngineForceFavicon [ "@nixvim" ]
                "https://nix-community.github.io/nixvim/search/?option_scope=0&query={searchTerms}"
                "https://nix-community.github.io/nixvim/search/favicon.ico";

            # Media
            "youtube" = mkEngine [ "@yt" ] "https://www.youtube.com/results?search_query={searchTerms}" "ico";
            "Spotify" =
              mkEngineForceFavicon [ "@sp" "@spotify" ] "https://open.spotify.com/search/{searchTerms}"
                "https://open.spotifycdn.com/cdn/images/favicon16.1c487bff.png";
            "Netflix" = mkEngine [ "@nfx" ] "https://www.netflix.com/search?q={searchTerms}" "ico";
            "IMDb" = mkEngine [ "@imdb" ] "https://www.imdb.com/find?q={searchTerms}" "ico";

            # Minecraft
            "Modrinth" = mkModrinth [ "@mr" ] "mods";
            "Modrinth Resource Packs" = mkModrinth [ "@mrr" ] "resourcepacks";
            "Modrinth Data Packs" = mkModrinth [ "@mrd" ] "datapacks";

            # Misc
            "Firefox Add-ons" = mkEngine [
              "@addons"
            ] "https://addons.mozilla.org/en-US/firefox/search/?q={searchTerms}" "ico";
            "Urban Dictionary" = mkEngine [
              "@ud"
              "@urban"
            ] "https://www.urbandictionary.com/define.php?term={searchTerms}" "ico";
            "Google Translate" = mkEngine [
              "@translate"
            ] "https://translate.google.com/?sl=auto&tl=en&text={searchTerms}&op=translate" "ico";

            # Overrides
            "History".metaData.alias = "@h";
            "Bookmarks".metaData.alias = "@b";
            "Tabs".metaData.alias = "@t";
            "bing".metaData.hidden = true;
            "amazondotcom-us".metaData.alias = "@amz";
            "google".metaData.alias = "@g";
            "wikipedia".metaData.alias = "@w";
            "ddg".metaData.alias = "@ddg";
          }; # end of let-in for search
      }; # programs.firefox.profiles.default.search
    }; # programs.firefox.profiles.default
    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/uBlock0@raymondhill.net/latest.xpi";
          installation_mode = "force_installed";
        }; # uBlock settings
      }; #programs.firefox.policies.ExtensionSettings
    }; # programs.firefox.policies
  }; # programs.firefox

  # Neovim config with nixvim
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    plugins.lspconfig.enable = true;
    plugins.treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
      };
    };
    lsp = {
      servers.ruff.enable = true;
      servers.rust_analyzer.enable = true;
      servers.tinymist.enable = true;
      servers.html.enable = true;
      servers.typos_lsp.enable = true;
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
        lua = [ "stylua" ];
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
  # VCS
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Demetrius Semanko";
        email = "143662059+DemetriusSemanko@users.noreply.github.com";
      };
    };
  };
  programs.git.enable = true;

  # Compilers, whatever
  programs.gcc.enable = true;
  programs.java.enable = true;

  # Nix-specific
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
    }; # programs.nh.clean
  }; # programs.nh

  home.packages = [
    pkgs.nix-inspect
    pkgs.nerd-fonts.fira-code
    pkgs.newcomputermodern
    pkgs.ghc
    pkgs.haskellPackages.QuickCheck
  ];
}
