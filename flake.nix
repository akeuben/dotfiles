{
  	description = "My Personal NixOS System Flake Configuration";

  	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

        nixos-hardware = {
            url = "github:NixOS/nixos-hardware/master";
        };

        nixCats = {
            url = "github:BirdeeHub/nixCats-nvim";
        };

        hycov={
            url = "github:DreamMaoMao/hycov";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        stylix = {
            url = "github:danth/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        zls = {
            url = "github:zigtools/zls";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        shell = {
            url = "github:akeuben/shell";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hytale = {
            url = "github:akeuben/Hytale-Nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
  	};

  	outputs = inputs @ { nixpkgs, home-manager, nixos-hardware, stylix, ... }:
	let
		user = "avery";
	in {
		nixosConfigurations = (
			import ./system/host {
				inherit (nixpkgs) lib;
				inherit inputs nixpkgs user home-manager nixos-hardware stylix;
			}
		);
	};
}
