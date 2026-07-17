{self, inputs, ...}: {
    flake.nixosModules.openrgb = {pkgs, lib, ...}: {
        services.hardware.openrgb.enable = true;
    };
}
