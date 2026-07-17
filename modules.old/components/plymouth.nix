{ self, inputs, ...}: {
    flake.nixosModules.plymouth = {pkgs, lib, ...}: {
        boot.plymouth.enable = true;
        boot.kernelParams = ["quiet"];
    };
}

