{
    den.aspects.minecraft = {
        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                (prismlauncher.override {
                    additionalLibs = [
                        libxtst
                        libxi
                    ];
                    jdks = [
                        jdk25
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
