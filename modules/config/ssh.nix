{
    den.aspects.ssh = {
        nixos = {
            services.openssh = {
                enable = true;
                settings.PermitRootLogin = "yes";
            };
        };
    };
}
