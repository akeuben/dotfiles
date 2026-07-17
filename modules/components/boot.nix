{ self, inputs, ...}: {
    flake.nixosModules.boot = {pkgs, lib, ...}: {
        boot.loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
    };
}

