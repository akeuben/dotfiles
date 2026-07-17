{self, inputs, ...}: {
    flake.nixosModules.feature-desktop = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixosModules; [
            desktoppackages
            niri
            hypr
            kitty
<<<<<<< Updated upstream
            graphics
=======
            musescore
            evolution
            kdeconnect
            pipewire
            qt
>>>>>>> Stashed changes
        ];
    };
}
