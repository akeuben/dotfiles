{ den, ... }: {
    den.aspects.avery = {
        includes = [
            den.batteries.define-user
            den.batteries.primary-user
            (den.batteries.user-shell "fish")
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
