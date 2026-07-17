{ self, inputs, ...}: {
    flake.nixosModules.time = {pkgs, lib, ...}: {
        services.automatic-timezoned.enable = true;
    };
}

