
{ self, inputs, ...}: {
    flake.nixosModules.gvfs = {pkgs, lib, ...}: {
        services.gvfs.enable = true;
    };
}
