{self, inputs, ...}: {
    flake.nixosModules.kdeconnect = {pkgs, lib, ...}: {
        programs.kdeconnect.enable = true;
    };
}
