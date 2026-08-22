{
    den.aspects.nh = {
        nixos = {host, ...}: {
            programs.nh = {
                enable = true;
                flake = host.flakepath;
                clean = {
                    enable = true;
                    dates = "weekly";
                    extraArgs = "--keep 3 --nogcroots --nogc";
                };
            };
        };
    };
}
