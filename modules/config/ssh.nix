{
    den.aspects.ssh = {
        nixos = {
            services.openssh = {
                enable = true;
                settings.PermitRootLogin = "yes";
            };
        };

        provides.to-users.homeManager = {
            programs.ssh = {
                enable = true;
                enableDefaultConfig = false;
                settings = {
                    "*" = {
                        ForwardAgent=false;
                        ServerAliveInterval=0;
                        ServerAliveCountMax=3;
                        Compression=false;
                        HashKnownHosts=false;
                        UserKnownHostsFile="~/.ssh/known_hosts";
                        ControlMaster=false;
                        ControlPath="~/.ssh/master-%r@%n:%p";
                    };
                };
            };
        };
    };
}
