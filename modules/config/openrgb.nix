{
    den.aspects.openrgb = {
        nixos = {host, ...}: {
            services.hardware.openrgb = {
                enable = true;
                motherboard = 
                    if host.name == "enterprise" then 
                        (builtins.trace "test" "amd")
                    else
                        null
                    ;
            };
            boot.kernelParams = [
                "acpi_enforce_resources=lax"
            ];
        };
    };
}
