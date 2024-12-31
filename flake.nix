{
  	description = "My Personal NixOS System Flake Configuration";

  	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

        nixos-hardware = {
            url = "github:NixOS/nixos-hardware/master";
        };

        nixvim = {
            url = "github:nix-community/nixvim";
        };

        hycov={
            url = "github:DreamMaoMao/hycov";
        };
        stylix.url = "github:danth/stylix";
        zls.url = "github:akeuben/zls";

        shell.url = "github:akeuben/shell";
  	};

  	outputs = inputs @ { nixpkgs, nixpkgs-unstable, home-manager, nixos-hardware, stylix, ... }:
	let
		user = "avery";
	in {
		nixosConfigurations = (
			import ./system/host {
				inherit (nixpkgs) lib;
				inherit inputs nixpkgs nixpkgs-unstable user home-manager nixos-hardware stylix;
			}
		);
	};
}
