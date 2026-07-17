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
    };
}
