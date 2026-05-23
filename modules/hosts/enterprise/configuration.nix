{ self, inputs, ...}: {
    flake.nixos-modules.hosts.enterprise.configuration = {pkgs, lib, ...}: {
        imports = with self.nixos-modules; [
            user.avery
            hosts.enterprise.hardware 

            features.core
            features.desktop
            features.development
            features.gaming
        ];

        networking.hostName = "enterprise";

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        nix.settings.experimental-features = ["nix-command" "flakes"];
    };
}
