{ self, inputs, ...}: {
	flake.nixosModules.neofetch = { pkgs, lib, ... }: {
		environment.systemPackages = [
			self.packages.${pkgs.stdenv.hostPlatform.system}.neofetch
		];
	};

	perSystem = { pkgs, lib, self', ... }: {
        packages.neofetch = inputs.wrapper-modules.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.fastfetch;

            addFlag = [
                [
                    "-s"
                    "Title:Separator:OS:Host:Kernel:Uptime:Shell:Display:DE:WM:WMTheme:Theme:Icons:Terminal:CPU:GPU:Memory:Break:Battery:Colors"
                    "--ds-force-drm"
                ]
            ];
            exePath = "bin/neofetch";
        };
	};
}
