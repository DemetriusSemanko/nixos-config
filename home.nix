{inputs, pkgs, ...}: {
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
	};
	plugins.lspsaga.enable = true;
	plugins.web-devicons.enable = true;
	plugins.dropbar.enable = true;
	plugins.guess-indent.enable = true;
    };   
    programs.gcc.enable = true;
    
    home.packages = [
    	pkgs.nix-inspect
	pkgs.nerd-fonts.fira-code
	pkgs.ghc
	pkgs.haskellPackages.QuickCheck
    ];
}
