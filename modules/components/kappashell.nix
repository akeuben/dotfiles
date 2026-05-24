{ self, inputs, ...}: {
	perSystem = { pkgs, lib, self', ... }: {
        packages.kappashell = inputs.wrapper-modules.lib.wrapPackage {
            inherit pkgs;
            package = inputs.kappashell.packages.${pkgs.stdenv.hostPlatform.system}.kappashell-desktop;
        };
	};
}
