{ self, inputs, ...}: {
    flake.nixos-modules.hosts.voyager.configuration = {pkgs, lib, ...}: {
        imports = with self.nixos-modules; [
            user.avery
            voyagerHardware
            niri
            corepackages
            network
            nvim
            hello
        ];

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        nix.settings.experimental-features = ["nix-command" "flakes"];
    };
}
