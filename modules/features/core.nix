{self, inputs, ...}: {
    flake.nixosModules.feature-core = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixosModules; [
            bluetooth
            boot
            corepackages 
            dbus
            dconf
            fish
            gnupg
            gvfs
            hello
            keyring
            neofetch
            network
            nh
            nix
            nvim 
            plymouth
            ssh
            swap
            tailscale
            time
            tmux
<<<<<<< Updated upstream
            graphics
=======
            upower
>>>>>>> Stashed changes
        ];

        system.stateVersion = "26.05";
    };
}
