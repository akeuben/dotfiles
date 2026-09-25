{
    den.aspects.linux = {
        nixos = {pkgs, ...}: {
            boot.kernelPackages = pkgs.linuxPackages_latest;
        };
    };
}
