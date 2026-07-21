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

    den.hosts.x86_64-linux.voyager = {
        users = { inherit avery; };

        flakepath = "/home/avery/code/projects/current/dotfiles?submodules=1";
    };

    den.hosts.x86_64-linux.enterprise = {
        users = { inherit avery; };

        flakepath = "/home/avery/code/projects/current/dotfiles?submodules=1";
    };
}
