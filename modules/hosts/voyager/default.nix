{ self, inputs, ...}: {
    flake.nixosConfigurations.voyager = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.voyagerConfiguration
        ];
    };
}
