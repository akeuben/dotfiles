{ self, lib, ... }: {
	flake.nixosModules.corepackages = { pkgs, lib, ... }: {
		environment.systemPackages = [
			pkgs.git
			pkgs.nh
		];
	};
}
