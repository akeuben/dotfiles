{
    den.aspects.hostname = {
        nixos = {host, ...}: {
            networking.hostName = host.name;
        };
    };
}
