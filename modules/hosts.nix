let 
    avery = {
        realName = "Avery Keuben";
        email = "avery1516@gmail.com";
        wallpaper = ../resources/wallpaper-avery.png;
        polarity = "dark";
    };

    htpc = {
    };
in {
    den.hosts.x86_64-linux.ds9 = {
        users = { inherit avery htpc; };

        flakepath = "/home/avery/dotfiles?submodules=1";
    };

    den.hosts.x86_64-linux.spacedock = {
        users = { inherit avery htpc; };

        flakepath = "/home/avery/dotfiles?submodules=1";
    };

    den.hosts.x86_64-linux.voyager = {
        users = { inherit avery; };

        flakepath = "/home/avery/code/projects/current/dotfiles?submodules=1";
    };

    den.hosts.x86_64-linux.enterprise = {
        users = { inherit avery; };

        monitors = [
            { name = "DP-1"; resolution = "2560x1440@165"; position = "0x0"; scale = 1.0; }
            { name = "DP-2"; resolution = "2560x1440@165"; position = "2560x0"; scale = 1.0; }
        ];

        flakepath = "/home/avery/code/projects/current/dotfiles?submodules=1";
    };
}
