{ self, inputs, ... }: {
    flake.nixosModules.hyprland = { pkgs, lib, ... }: {
        programs.hyprland = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        };
    };

    perSystem = { pkgs, lib, self', ...}: {
        packages.hyprland = inputs.wrapper-modules.wlib.modules.makeWrapper {

        };
    };
}
