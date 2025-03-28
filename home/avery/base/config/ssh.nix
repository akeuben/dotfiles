{ ... }: {
    programs.ssh.enable = true;
    programs.ssh.matchBlocks = {
        "github.com" = {
            user="git";
            hostname="github.com";
            identityFile="~/.ssh/github";
        };
        "ucalgary" = {
            user="avery.keuben";
            hostname="cslinux.ucalgary.ca";
            port=22;
            identityFile="~/.ssh/ucalgary";
        };
        "ucalgaryarm" = {
            user="avery.keuben";
            hostname="csarm.ucalgary.ca";
            port=22;
            identityFile="~/.ssh/ucalgary";
        };
        "oracle" = {
            user="opc";
            hostname="155.248.220.19";
            port=22;
            identityFile="~/.ssh/oracle.key";
        };
    };
}
