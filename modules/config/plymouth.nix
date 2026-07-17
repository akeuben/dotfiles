{
    den.aspects.plymouth = {
        nixos = {
            boot.plymouth.enable = true;
            boot.kernelParams = ["quiet"];
        };
    };
}
