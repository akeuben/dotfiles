{self, inputs, ...}: {
    flake.nixosModules.feature-desktop = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixosModules; [
            niri
            hypr
            kitty
        ];
    };
}
