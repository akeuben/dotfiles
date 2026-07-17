{self, inputs, ...}: {
    flake.nixosModules.feature-development = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixosModules; [
            developmentpackages
            tmux
            neofetch
        ];
    };
}

