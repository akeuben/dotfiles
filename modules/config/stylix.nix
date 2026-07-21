{inputs, ...}: {
    den.aspects.stylix = {
        nixos = {pkgs, ...}: {
            imports = [
                inputs.stylix.nixosModules.stylix
            ];

            stylix = {
                enable = true;
                base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
            };
        };

        provides.to-users.homeManager = {user, pkgs, ...}: {
            stylix = {
                base16Scheme = "${pkgs.base16-schemes}/share/themes/${user.colorscheme or "gruvbox-dark-hard"}.yaml";
                image = user.wallpaper or ../../resources/defaultwallpaper.png;
                polarity = user.polarity or "either";
            };
        };
    };
}
