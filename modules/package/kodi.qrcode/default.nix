{
    perSystem = { pkgs, lib, ... }: {
        packages.kodi-qrcode = pkgs.kodiPackages.buildKodiAddon {
            pname = "qrcode";
            namespace = "script.module.qrcode";
            version = "6.1.0+matrix.3";
            src = pkgs.fetchzip {
                url = "https://mirrors.kodi.tv/addons/omega/script.module.qrcode/script.module.qrcode-6.1.0+matrix.3.zip";
                sha256 = "sha256-nO0bnXinKQfNDrx1Kd610uS8ejeAAq9PcQg+ZiOA3Gw=";
            };
        };
    };
}
