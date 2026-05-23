{ self, inputs, ...}: {
    flake.nixos-configurations.hosts.enterprise = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixos-modules.hosts.enterprise.configuration
        ];
    };
}
