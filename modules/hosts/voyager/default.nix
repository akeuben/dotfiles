{ self, inputs, ...}: {
    flake.nixos-configurations.hosts.voyager = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixos-modules.hosts.voyager.configuration
        ];
    };
}
