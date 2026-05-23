{self, inputs, ...}: {
    flake.nixos-modules.features.development = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixos-modules; [
        ];
    };
}

