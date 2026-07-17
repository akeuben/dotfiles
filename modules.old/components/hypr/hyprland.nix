{ self, inputs, ... }: {
    flake.nixosModules.hypr = { pkgs, lib, ... }: {
        environment.systemPackages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.kappashell
        ];
        programs.hyprland = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        };
    };

    perSystem = { pkgs, lib, self', ...}: {
        packages.hyprland = inputs.wrapper-modules.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.hyprland;

            addFlag = [
                "--config"
                ./hypr/hyprland.conf
            ];

            prefixVar = [
                [
                    "PATH"
                    ":"
                    "${lib.makeBinPath (with pkgs; [
                        self'.packages.kitty
                        nautilus
                        firefox
                        self'.packages.hyprpaper
                        self'.packages.kappashell
                    ])}"
                ]
            ];
        };
    };
}
