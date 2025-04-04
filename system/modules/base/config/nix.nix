{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    nix.settings.trusted-users = [ "root" "avery" ];
    nix = {
        package = pkgs.nixVersions.stable;
        extraOptions = ''
        experimental-features = nix-command flakes
        '';
        channel.enable = false;
    };

}
