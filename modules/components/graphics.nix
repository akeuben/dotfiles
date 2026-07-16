{ self, lib, ... }: {
	flake.nixosModules.graphics = { pkgs, lib, ... }: {
		hardware.graphics.enable = true;
	};
}
