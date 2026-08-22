{
    perSystem = { pkgs, ... }: {
        packages.kodi-skinvariables = pkgs.kodiPackages.buildKodiAddon {
            pname = "skinvariables";
            namespace = "script.skinvariables";
            version = "2.2.2";
            src = pkgs.fetchzip (import ./src);
        };
    };
}
