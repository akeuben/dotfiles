{ self, inputs, ...}: {
    flake.nixosModules.voyagerConfiguration = {pkgs, lib, ...}: {
        imports = with self.nixosModules; [
            voyagerHardware
            niri
            userAvery
            core
            network
            nvim
            hello
        ];

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        nix.settings.experimental-features = ["nix-command" "flakes"];
    };
}
