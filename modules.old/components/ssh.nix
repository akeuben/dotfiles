{ self, inputs, ...}: {
    flake.nixosModules.ssh = {pkgs, lib, ...}: {
        services.openssh.enable = true;
        services.openssh.settings.PermitRootLogin = "yes";
    };
}

