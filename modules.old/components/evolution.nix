{ self, lib, ...}: {
    flake.nixosModules.evolution = { pkgs, lib, ...}: {
        services.gnome.evolution-data-server.enable = true;
        programs.evolution = {
            enable = true;
            plugins = [ pkgs.evolution-ews ];
        };
    };
}
