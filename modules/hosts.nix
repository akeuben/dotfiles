let 
    avery = {
        realName = "Avery Keuben";
        email = "avery1516@gmail.com";
    };

    htpc = {
    };
in {
    den.hosts.x86_64-linux.ds9 = {
        users = { inherit avery htpc; };

        flakepath = "/home/avery/dotfiles";
    };

    den.hosts.x86_64-linux.voyager = {
        users = { inherit avery; };

        flakepath = "/home/avery/code/projects/current/dotfiles";
    };

    den.hosts.x86_64-linux.enterprise = {
        users = { inherit avery; };

        flakepath = "/home/avery/code/projects/current/dotfiles";
    };
}
