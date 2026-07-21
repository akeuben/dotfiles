{den, ...}: {
    den.aspects.feature.core = {
        includes = with den.aspects; [
            bluetooth
            boot
            dbus
            dconf
            hostname
            nvim
            fish
            git
            gnupg
            gvfs
            keyring
            network
            nh
            nix
            plymouth
            ssh
            stylix
            time
            tmux
            graphics
            upower
        ];

        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                git
                wl-clipboard
                jq
                curl
            ];
        };
    };
}
