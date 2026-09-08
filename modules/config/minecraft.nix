{
    den.aspects.minecraft = {
        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                (prismlauncher.override {
                    additionalLibs = [
                        xorg.libXtst
                        xorg.libXi
                    ];
                })
                mcpelauncher-ui-qt
            ];
        };
    };
}
