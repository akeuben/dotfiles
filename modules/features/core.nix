{self, inputs, ...}: {
    flake.nixos-modules.features.core = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixos-modules; [
            corepackages 
            hello
            network 
        ];
    };
}
