{
    den.aspects.boot = {
        nixos = {
            boot.loader = {
                systemd-boot.enable = true;
                efi.canTouchEfiVariables = true;
            };
        };
    };
}
