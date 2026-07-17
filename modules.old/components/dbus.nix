{ self, inputs, ...}: {
    flake.nixosModules.dbus = {pkgs, lib, ...}: {
        services.dbus.enable = true;
    };
}

