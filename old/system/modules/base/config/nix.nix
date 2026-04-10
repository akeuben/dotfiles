{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    nix = {
        package = pkgs.nixVersions.stable;
        extraOptions = ''
        experimental-features = nix-command flakes
        '';
        channel.enable = false;
        settings = {
            trusted-users = [ "root" "avery" ];
            substituters = [
                "https://nix-community.cachix.org"
                "https://cache.nixos.org/"
            ];
            trusted-public-keys = [
                "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            ];
        };
    };

}
