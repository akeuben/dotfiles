{
    perSystem = { pkgs, ... }: {
        packages.kodi-themoviedb-helper = pkgs.kodiPackages.buildKodiAddon {
            pname = "themoviedb-helper";
            namespace = "plugin.video.themoviedb.helper";
            version = "6.16.1";
            src = pkgs.fetchzip (import ./src);
        };
    };
}
