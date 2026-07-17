{den, ...}: {
    den.aspects.feature.core = {
        includes = with den.aspects; [
            bluetooth
            boot
            dbus
            dconf
            fish
            gnupg
            gvfs
            keyring
            network
            nh
            nix
            plymouth
            ssh
            time
            graphics
            upower
        ];

        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                git
                wl-clipboard
            ];
        };
    };
}
