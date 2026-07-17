{ self, inputs, ...}: {
	flake.nixosModules.stylix = { pkgs, lib, ... }: {
        imports = [
            inputs.stylix.nixosModules.stylix
        ];

        stylix = {
            enable = true;
        };
	};
}
