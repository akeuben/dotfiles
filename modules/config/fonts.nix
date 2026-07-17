{
    den.aspects.fonts = {
        nixos = {pkgs, ...}: {
            fonts.packages = with pkgs; [
                noto-fonts
                noto-fonts-color-emoji
                font-awesome
            ];
        };
    };
}
