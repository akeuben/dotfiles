{self, inputs, ...}: {
    flake.nixosModules.feature-gaming = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixosModules; [
        ];
    };
}
