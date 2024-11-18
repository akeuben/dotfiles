{lib, pkgs, config, ...}: let 
    wayland-sessions = lib.strings.concatStringsSep ":" (map (package: "${package}/share/wayland-sessions")(config.properties.wayland-sessions.session-list));
    xorg-sessions = lib.strings.concatStringsSep ":" (map (package: "${package}/share/xsessions")(config.properties.xorg-sessions.session-list));
in {
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.greetd.tuigreet}/bin/tuigreet --issue --time --remember --remember-session --user-menu --sessions ${wayland-sessions} --xsessions ${xorg-sessions} --xsession-wrapper '${pkgs.xorg.xinit}/bin/startx /usr/bin/env'";
                user = "greeter";
            };
        };
    };
}
