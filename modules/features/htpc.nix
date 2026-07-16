{self, inputs, ...}: {
    flake.nixosModules.feature-htpc = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixosModules; [
            bigscreen
            graphics

            user-htpc
        ];

        system.stateVersion = "26.05";
    };
}
