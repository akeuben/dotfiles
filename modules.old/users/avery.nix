{ self, inputs, ...}: {
    flake.nixosModules.user-avery = { pkgs, lib, ...}: {
        users.users.avery = {
            isNormalUser = true;
            createHome = true;
            initialPassword = "changeme";
            shell = pkgs.fish;
            extraGroups = [
                "wheel"
                "networkmanager"
                "adbusers"
                "plugdev"
                "dialout"
            ];
        };
    };
}
