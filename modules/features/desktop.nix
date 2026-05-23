{self, inputs, ...}: {
    flake.nixos-modules.features.desktop = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixos-modules; [
            niri
        ];
    };
}
