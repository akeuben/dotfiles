{ den, ... }: {
    den.aspects.avery = {
        includes = [
            den.batteries.define-user
            den.batteries.primary-user
            (den.batteries.user-shell "fish")

            den.aspects.feature.desktop
        ];

        nixos = {
            users.users.avery = {
                initialPassword = "changeme";
            };
        };

        homeManager = { pkgs, ... }: {
            home.packages = [ pkgs.htop ];
        };
    };
}
