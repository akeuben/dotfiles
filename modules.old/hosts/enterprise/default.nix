{ self, inputs, ...}: {
    flake.nixosConfigurations.enterprise = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.host-enterprise-configuration
        ];
    };
}
