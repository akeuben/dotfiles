{ self, inputs, ...}: {
    flake.nixosModules.keyring = {pkgs, lib, ...}: {
        services.gnome.gnome-keyring.enable = true;
    };
}
