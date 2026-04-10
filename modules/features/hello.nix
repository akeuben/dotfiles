{ self, inputs, ...}: {
	flake.nixosModules.hello = { pkgs, lib, ... }: {
		environment.systemPackages = [
			self.packages.${pkgs.stdenv.hostPlatform.system}.hello
		];
	};

	perSystem = { pkgs, lib, self', ... }: {
        packages.hello = inputs.wrapper-modules.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.hello;

            addFlag = [
                [
                    "--greeting"
                    "test"
                ]
            ];
        };
	};
}
