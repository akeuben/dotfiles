{ self, ...}: {
    flake.nixosModules.host-ds9-configuration = {...}: {
        imports = with self.nixosModules; [
            user-avery
            host-ds9-hardware 

            feature-core
            feature-gaming
            feature-htpc
        ];

        networking.hostName = "ds9";

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        nix.settings.experimental-features = ["nix-command" "flakes"];
    };
}
