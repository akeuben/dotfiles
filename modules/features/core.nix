{ self, lib, ... }: {
	flake.nixosModules.core = { pkgs, lib, ... }: {
		environment.systemPackages = [
			pkgs.git
			pkgs.nh
		];
	};
}
