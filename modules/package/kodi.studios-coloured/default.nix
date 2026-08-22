{
    perSystem = {pkgs, ...}: {
        packages.kodi-studios-coloured = pkgs.kodiPackages.buildKodiAddon {
            pname = "studios-coloured";
            namespace = "resource.images.studios.coloured";
            version = "0.0.23";

            src = pkgs.fetchzip (import ./src);

            passthru = {
                pythonPath = "resources/lib";
            };
        };
    };
}
