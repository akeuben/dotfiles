{self, inputs, ...}: {
    flake.nixos-modules.features.core = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixos-modules; [
            core-packages 
            hello
            network 
        ];
    };
}
