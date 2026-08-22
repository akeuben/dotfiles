{
    outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        hardware = {
            url = "github:nixos/nixos-hardware";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        den.url = "github:denful/den";

        flake-file.url = "github:vic/flake-file";
        flake-parts.url = "github:hercules-ci/flake-parts";

        home-manager = {
            inputs.nixpkgs.follows = "nixpkgs";
            url = "github:nix-community/home-manager";
        };

        import-tree.url = "github:vic/import-tree";
        wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

        shell = {
            url = "github:akeuben/shell/vala-rewrite";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.astal.inputs.nixpkgs.follows = "nixpkgs";
        };

        stylix = {
            url = "github:nix-community/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
}
