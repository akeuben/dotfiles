{ self, inputs, ...}: {
	flake.nixosModules.fish = { pkgs, lib, ... }: {
        programs.fish = {
            enable = true;
            shellInit = "
                source ${./fish}/config.fish
            ";
		};
	};
}
