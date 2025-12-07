{
  description = "My first flake, to be changed";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-inspect.url = "github:bluskript/nix-inspect";
  };

  outputs = { self, nixpkgs, nixvim, home-manager, nix-inspect, ... }@inputs: {
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
