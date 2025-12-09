{inputs, ...}: {
    imports = [
	inputs.nixvim.homeModules.nixvim
    ];
    home.stateVersion = "26.05";
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
    };   
    home.packages = [
	inputs.nix-inspect.packages.x86_64-linux.default
    ];
}
