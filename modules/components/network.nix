{ self, inputs, ...}: {
    flake.nixos-modules.network = {pkgs, lib, ...}: {
        networking.networkmanager.enable = true;
    };
}
