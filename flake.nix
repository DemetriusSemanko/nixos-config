{
  description = "My first flake, to be changed";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixvim, home-manager, ... }@inputs: {
    nixosConfigurations.delphi = nixpkgs.lib.nixosSystem {
	modules = [
	    ./configuration.nix
            home-manager.nixosModules.home-manager
            {
            	home-manager.useGlobalPkgs = true;
            	home-manager.useUserPackages = true;
            	home-manager.users.demsem = ./home.nix;
		home-manager.extraSpecialArgs = { inherit inputs;};
            }
	];
    };
  };
}
