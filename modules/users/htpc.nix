{ self, inputs, ...}: {
    flake.nixosModules.user-htpc = { pkgs, lib, ...}: {
        imports = [
            inputs.home-manager.nixosModules.default
        ];

        users.users.htpc = {
            isNormalUser = true;
            createHome = true;
            hashedPassword = "";
            shell = pkgs.fish;
            extraGroups = [
                "networkmanager"
            ];
        };

        home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users.htpc.imports = [
                self.homeModules.htpc
            ];
        };

        services.displayManager = {
            autoLogin = {
                enable = true;
                user = "htpc";
            };
        };
    };

    flake.homeModules.htpc = {
        home = {
        stateVersion = "26.11";
        };
    };
}
