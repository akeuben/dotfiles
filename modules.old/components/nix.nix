{ self, inputs, ...}: {
    flake.nixosModules.nix = {pkgs, lib, ...}: {
        nixpkgs.config.allowUnfree = true;
        nix = {
            package = pkgs.nixVersions.stable;
            channel.enable = false;
            settings = {
                trusted-users = [ "root" "avery" ];
                experimental-features = ["nix-command" "flakes"];
                substituters = [
                    "https://nix-community.cachix.org"
                    "https://cache.nixos.org"
                ];
                trusted-public-keys = [
                    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
                ];
            };
        };
    };
}
