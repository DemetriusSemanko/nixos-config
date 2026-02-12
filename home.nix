{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  home.stateVersion = "26.05";


  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash.enable = true;

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
      };
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
    plugins.cmp-spell.enable = true;
    plugins.toggleterm = {
      enable = true;
      settings.open_mapping =  "[[<C-\\>]]";
    };
  };

  programs.gcc.enable = true;
  programs.java.enable = true;

  home.packages = [
    pkgs.nix-inspect
    pkgs.nerd-fonts.fira-code
    pkgs.ghc
    pkgs.haskellPackages.QuickCheck
  ];
}
