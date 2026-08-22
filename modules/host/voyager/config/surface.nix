{inputs, ...}: {
    den.aspects.voyager.surface = {
        nixos = {
            imports = [
                inputs.hardware.nixosModules.microsoft-surface-pro-intel
            ];
            hardware.microsoft-surface.kernelVersion = "stable";
            services.iptsd = {
                enable = true;
                config = {
                    Touchscreen = {
                        DisableOnPalm = true;
                        DisableOnStylus = true;
                    };
                };
            };
        };
    };
}
