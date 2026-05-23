{ self, inputs, ...}: {
    flake.nixos-modules.hosts.voyager.configuration = {pkgs, lib, ...}: {
        imports = with self.nixos-modules; [
            user.avery
            hosts.voyager.hardware 

            features.core
            features.desktop
            features.development
        ];

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        nix.settings.experimental-features = ["nix-command" "flakes"];
    };
}
