{ self, lib, ... }: {
	flake.nixos-modules.corepackages = { pkgs, lib, ... }: {
		environment.systemPackages = [
			pkgs.git
			pkgs.nh
		];
	};
}
