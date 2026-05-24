{self, inputs, ...}: {
    flake.nixosModules.feature-core = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixosModules; [
            corepackages 
            hello
            network
            nvim 
            fish
            neofetch
            tmux
        ];

        system.stateVersion = "26.05";
    };
}
