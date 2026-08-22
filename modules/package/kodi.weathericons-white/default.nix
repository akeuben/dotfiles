{
    perSystem = {pkgs, ...}: {
        packages.kodi-weathericons-white = pkgs.kodiPackages.buildKodiAddon {
            pname = "weathericons-white";
            namespace = "resource.images.weathericons.white";
            version = "0.0.6";

            src = pkgs.fetchzip (import ./src);

            passthru = {
                pythonPath = "resources/lib";
            };
        };
    };
}
