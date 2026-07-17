{
    den.aspects.evolution = {
        nixos = {pkgs, ...}: {
            services.gnome.evolution-data-server.enable = true;
            programs.evolution = {
                enable = true;
                plugins = [ pkgs.evolution-ews ];
            };
        };
    };
}
