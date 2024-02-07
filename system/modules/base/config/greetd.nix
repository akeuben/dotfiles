{ pkgs, lib }: let 
    wallpaper = ./wallpaper.jpg;
in {
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland --issue --time --remember --user-menu";
                user = "greeter";
            };
        };
    };
}
