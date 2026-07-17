{ self, lib, ...}: {
    flake.nixosModules.fonts = {pkgs, lib, ...}: {
        fonts.packages = with pkgs; [
            noto-fonts
            noto-fonts-color-emoji
            font-awesome
        ];
    };
}
