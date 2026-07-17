{ den, ... }: {
    den.aspects.avery = {
        includes = [
            den.batteries.define-user
            den.batteries.primary-user
            (den.batteries.user-shell "fish")
        ];

        homeManager = { pkgs, ... }: {
            home.packages = [ pkgs.htop ];
        };
    };
}
