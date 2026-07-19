{
    perSystem = {pkgs, ...}: {
        packages.kodi-openmeteo = pkgs.kodiPackages.buildKodiAddon {
            pname = "openmeteo";
            namespace = "weather.openmeteo";
            version = "0.0.3";

            src = pkgs.fetchzip (import ./src);
        };
    };
}

