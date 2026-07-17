{ self, lib, ... }: {
	flake.nixosModules.musescore = { pkgs, lib, ... }: {
		environment.systemPackages = with pkgs; [
            musescore
            muse-sounds-manager
		];
	};
}
