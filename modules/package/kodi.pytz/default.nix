{
    perSystem = {pkgs, ...}: {
        packages.kodi-pytz = pkgs.kodiPackages.buildKodiAddon {
            pname = "pytz";
            namespace = "script.module.pytz";
            version = "0.0.3";

            src = pkgs.fetchzip {
                url = "http://ftp.halifax.rwth-aachen.de/xbmc/addons/omega/script.module.pytz/script.module.pytz-2023.3.0+matrix.1.zip";
                hash = "sha256-GNUdxFetiuYUOvzOXS8oQwxIyUF7Y2q8lV/UftqVvQs=";
            };
        };
    };
}

