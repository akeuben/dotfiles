{
    den.aspects.vesktop = {
        nixos = {
            nixpkgs.config.permittedInsecurePackages = [
                "electron-40.10.5"
                "electron-39.8.10"
            ];
        };

        provides.to-users.homeManager = {
            programs.vesktop = {
                enable = true;
            };
        };
    };
}
