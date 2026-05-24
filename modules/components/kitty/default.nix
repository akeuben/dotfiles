{ self, inputs, ...}: {
	flake.nixosModules.kitty = { pkgs, lib, ... }: {
		environment.systemPackages = [
			self.packages.${pkgs.stdenv.hostPlatform.system}.kitty
		];
	};

	perSystem = { pkgs, lib, self', ... }: {
        packages.kitty = inputs.wrapper-modules.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.kitty;

            addFlag = [
                [
                    "--config"
                    ./kitty.conf
                ]
            ];
        };
	};
}
