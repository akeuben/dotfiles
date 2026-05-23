{self, inputs, ...}: {
    flake.nixos-modules.features.gaming = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixos-modules; [
        ];
    };
}