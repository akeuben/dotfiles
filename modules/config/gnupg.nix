{
    den.aspects.gnupg = {
        nixos = {pkgs, ...}: {
            programs.gnupg.agent = {
                enable = true;
                pinentryPackage = pkgs.pinentry-curses;
            };
        };
        provides.to-users.homeManager = {config, ...}: {
            home.sessionVariables.GNUPGHOME = "${config.xdg.dataHome}/gnupg";

            programs.fish.shellInit = ''
                set -gx GNUPGHOME "${config.xdg.dataHome}/gnupg"
            '';
        };
    };
}
