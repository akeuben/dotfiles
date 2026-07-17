{ self, ...}: {
    flake.nixosModules.host-voyager-configuration = {...}: {
        imports = with self.nixosModules; [
            user-avery
            host-voyager-hardware 

            feature-core
            feature-desktop
            feature-development

            surface
        ];

        networking.hostName = "voyager";

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        nix.settings.experimental-features = ["nix-command" "flakes"];
    };
}
