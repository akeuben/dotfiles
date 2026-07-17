{ self, inputs, ...}: {
    flake.nixosModules.gnupg = {pkgs, lib, ...}: {
        programs.gnupg.agent = {
            enable = true;
            pinentryPackage = pkgs.pinentry-curses;
        };
    };
}
