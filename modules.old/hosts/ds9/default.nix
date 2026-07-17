{ self, inputs, ...}: {
    flake.nixosConfigurations.ds9 = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.host-ds9-configuration
        ];
    };
}

