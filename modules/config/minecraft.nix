{
    den.aspects.minecraft = {
        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                (prismlauncher.override {
                    additionalLibs = [
                        libxtst
                        libxi
                    ];
                })
                mcpelauncher-ui-qt
            ];
        };
    };
}
