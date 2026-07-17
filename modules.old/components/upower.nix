{ self, inputs, ...}: {
    flake.nixosModules.upower = {pkgs, lib, ...}: {
        services.upower.enable = true;
    };
}
