{ self, inputs, ...}: {
    flake.nixos-modules.user.avery = { pkgs, lib, ...}: {
        users.users.avery = {
            isNormalUser = true;
            extraGroups = [
                "wheel"
                "networkmanager"
                "adbusers"
                "plugdev"
                "dialout"
            ];
        };
    };
}
