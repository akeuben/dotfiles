{
    den.aspects.plymouth = {
        nixos = {
            boot.plymouth.enable = true;
            boot.kernelParams = ["quiet" "systemd.show_status=false"];
            boot.consoleLogLevel = 3;
            stylix.targets.plymouth.enable = false;
        };
    };
}
