{
    den.aspects.openrgb = {
        nixos = {host, ...}: {
            services.hardware.openrgb = {
                enable = true;
                motherboard = 
                    if host.name == "enterprise" then 
                        "amd"
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
