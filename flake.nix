{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";

        wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
        plasma-manager = {
            url = "github:nix-community/plasma-manager";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.home-manager.follows = "home-manager";
        };
        
        kappashell = {
            url = "github:akeuben/shell/vala-rewrite";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs: inputs.flake-parts.lib.mkFlake
    {
        inherit inputs;
    }
    (inputs.import-tree ./modules);
}
