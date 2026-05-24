{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ...}: {
        packages.wallpaper = pkgs.writeTextFile {
            name = "wallpaper";
            text = ''
                wallpaper {
                    monitor=
                    path=${../../resources/wallpaper.jpeg}
                }
            '';
        };
        packages.hyprpaper = inputs.wrapper-modules.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.hyprpaper;

            addFlag = [
                "--config"
                self'.packages.wallpaper
            ];
        };
    };
}
