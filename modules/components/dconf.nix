{ self, inputs, ...}: {
    flake.nixosModules.dconf = {pkgs, lib, ...}: {
        programs.dconf.enable = true;
    };
}

