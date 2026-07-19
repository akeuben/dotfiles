{
    perSystem = {pkgs, ...}: {
        packages.kodi-arctic-fuse-3 = pkgs.kodiPackages.buildKodiAddon {
            pname = "arctic-fuse-3";
            version = "auto";
            namespace = "skin.arctic.fuse.3";

            src = pkgs.fetchzip (import ./src);

            passthru = {
                pythonPath = "resources/lib";
            };
        };
    };
}
