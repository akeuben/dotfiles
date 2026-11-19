{inputs, ...}: {
    den.aspects.stylix = {
        nixos = {pkgs, ...}: {
            imports = [
                inputs.stylix.nixosModules.stylix
            ];

            stylix = {
                enable = true;
                base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
                opacity = {
                    terminal = 0.85;
                };
                cursor = {
                    package = pkgs.vanilla-dmz;
                    name = "Vanilla-DMZ";
                    size = 32;
                };
                fonts = {
                    emoji = {
                        package = pkgs.twemoji-color-font;
                        name = "TwitterColorEmoji-SVGinOT";
                    };
                    monospace = {
                        package = pkgs.nerd-fonts.jetbrains-mono;
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
            };
        };

        provides.to-users.homeManager = {user, pkgs, config, ...}: {
            stylix = {
                base16Scheme = "${pkgs.base16-schemes}/share/themes/${user.colorscheme or "gruvbox-dark-hard"}.yaml";
                image = user.wallpaper or ../../resources/defaultwallpaper.png;
                polarity = user.polarity or "either";
                icons = {
                    package = pkgs.papirus-icon-theme;
                    dark = "Papirus-Dark";
                    light = "Papirus-Light";
                };
            };
            gtk.iconTheme = {
                name = config.stylix.icons.${user.polarity or "dark"};
                package = config.stylix.icons.package;
            };
        };
    };
}
