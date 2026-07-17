{
    den.aspects.minecraft = {
        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                (prismlauncher.override {
                    additionalLibs = [
                        xorg.libXtst
                        xorg.libXi
                    ];
                    jdks = [
                        jdk25
                        jdk23
                        jdk21
                        jdk17
                        jdk8
                    ];
                })
                mcpelauncher-ui-qt
            ];
        };
    };
}
