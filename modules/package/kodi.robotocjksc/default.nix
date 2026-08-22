{
    perSystem = {pkgs, ...}: {
        packages.kodi-robotocjksc = pkgs.kodiPackages.buildKodiAddon {
            pname = "robotocjksc";
            namespace = "resource.font.robotocjksc";
            version = "0.0.3";

            src = pkgs.fetchzip (import ./src);
        };
    };
}

