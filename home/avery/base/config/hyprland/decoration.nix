{ ... }: {
    xdg.configFile."hypr/lock.sh".source = ./lock.sh;

    wayland.windowManager.hyprland.settings = {
        general = {
            gaps_in = 5;
            gaps_out = "15, 10, 15, 10";
            border_size = 2;

            layout = "dwindle";
        };
        decoration = {
            rounding = 24;
            blur = {
                enabled = true;
                size = 3;
                passes = 4;
                xray = true;
                ignore_opacity = false;
                new_optimizations = true;
            };
        };
        animations = {
            enabled = true;
            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

            animation = [
                "windows, 1, 7, myBezier"
                "windowsOut, 1, 7, default, popin 80%"
                "border, 1, 10, default"
                "borderangle, 1, 8, default"
                "fade, 1, 7, default"
                "workspaces, 1, 6, default"
                "layers, 1, 3, default, fade"
            ];
        };
        dwindle = {
            pseudotile = true;
            preserve_split = true;
        };
        layerrule = [
            "blur on, match:namespace ^shell:"
            "xray on, match:namespace ^shell:"
            "animation slidevert, match:namespace ^shell:"
            "order 2, match:namespace ^shell:bar"
            "order 5, match:namespace ^shell:control_center"
            "order 7, match:namespace ^shell:calendar"
            "no_anim on, match:namespace ^shell"
        ];
        windowrule = [
            "match:title ^Unlock Database - KeePassXC,float on"
            "match:title ^(zoom)$,float on"
            "match:title ^(?!Steam$).*,match:class steam,float on"
            "match:class gamescope,fullscreen on"
            "match:class gamescope,workspace name:steam"
            "match:class gamescope,monitor DP-1"
            "match:initial_title Steam Big Picture Mode,fullscreen on"
            "match:initial_title Steam Big Picture Mode,workspace name:steam"
            "match:initial_title Steam Big Picture Mode,monitor DP-1"
            "match:class gamescope,suppress_event fullscreen maximize fullscreenoutput"
        ];
        misc = {
            disable_hyprland_logo = true;
        };
    };
}
