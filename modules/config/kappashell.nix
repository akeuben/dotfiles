{inputs, ...}: {
    den.aspects.kappashell = {
        nixos = {pkgs, ...}: {
            environment.systemPackages = [
                inputs.shell.packages.${pkgs.stdenv.hostPlatform.system}.kappashell-desktop
            ];
        };
    };
}
