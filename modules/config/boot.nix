{
    den.aspects.boot = {
        nixos = {
            boot.loader = {
                systemd-boot = {
                    enable = true;
                    consoleMode = "max";
                };
                efi.canTouchEfiVariables = true;
            };
        };
    };
}
