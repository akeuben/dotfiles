{self, inputs, ...}: {
    flake.nixosModules.qt = {pkgs, lib, ...}: {
        qt = {
            enable = true;
            platformTheme = "gnome";
            style = "adwaita-dark";
        };
    };
}
