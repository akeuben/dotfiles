{ pkgs, ... }: {
    stylix = {
        enable = true;    
        image = ./hyprpaper/wallpaper.jpeg;
        iconTheme = {
            enable = true;
            package = pkgs.kora-icon-theme;
            dark = "kora";
            light = "kora";
        };
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
        polarity = "dark";
        cursor = {
            package = pkgs.vanilla-dmz;
            name = "Vanilla-DMZ";
            size = 32;
        };
        opacity = {
            terminal = 0.85;
        };
        fonts = {
            emoji = {
                package = pkgs.twemoji-color-font;
                name = "TwitterColorEmoji-SVGinOT";
            };
            monospace = {
                package = with pkgs; (nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
                name = "JetBrainsMono Nerd Font";
            };
            sansSerif = {
                package = pkgs.noto-fonts;
                name = "Noto Sans";
            };
            serif = {
                package = pkgs.noto-fonts;
                name = "Noto Serif";
            };
        };
        targets.fish.enable = false;
        targets.hyprland.hyprpaper.enable = false;
    };
}
