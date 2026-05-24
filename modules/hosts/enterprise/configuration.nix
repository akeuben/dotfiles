{ self, ...}: {
    flake.nixosModules.host-enterprise-configuration = {...}: {
        imports = with self.nixosModules; [
            user-avery
            host-enterprise-hardware 

            feature-core
            feature-desktop
            feature-development
            feature-gaming
        ];

        networking.hostName = "enterprise";

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        nix.settings.experimental-features = ["nix-command" "flakes"];
    };
}
