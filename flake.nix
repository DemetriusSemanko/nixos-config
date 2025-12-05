{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { self, nixpkgs, nixvim }: {
    nixosConfigurations.delphi = nixpkgs.lib.nixosSystem {
	modules = [
	    ./configuration.nix
	];
    };
  };
}
