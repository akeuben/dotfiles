{ den, ... }: {
    den.aspects.htpc = {
        includes = [
            den.batteries.define-user
            den.batteries.primary-user
            (den.batteries.user-shell "fish")
        ];

        nixos = {
            users.users.htpc = {
                hashedPassword = "";
            };
        };
    };
}
