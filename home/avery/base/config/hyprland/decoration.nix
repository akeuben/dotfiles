{ ... }: {
    xdg.configFile."hypr/lock.sh".source = ./lock.sh;

    wayland.windowManager.hyprland.settings = {
        general = {
            gaps_in = 5;
            gaps_out = 20;
            border_size = 2;

            layout = "dwindle";
        };
        decoration = {
            rounding = 10;
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
            "blur, ^shell:"
            "ignorezero, ^shell:"
            "xray 1, ^shell:"
            "animation slidevert, ^shell:"
            "order 2, ^shell:bar"
            "order 5, ^shell:control_center"
            "order 7, ^shell:calendar"
        ];
        windowrulev2 = [
            "float,title:^Unlock Database - KeePassXC$"
            "float,title:^(zoom)$"
            "float,title:^(?!Steam$).*,class:steam"
            "fullscreen,class:gamescope"
            "workspace name:steam,class:gamescope"
            "monitor DP-1,class:gamescope"
            "fullscreen,initialTitle:Steam Big Picture Mode"
            "workspace name:steam,initialTitle:Steam Big Picture Mode"
            "monitor DP-1,initialTitle:Steam Big Picture Mode"
            "suppressevent fullscreen maximize fullscreenoutput,class:gamescope"
        ];
        misc = {
            disable_hyprland_logo = true;
        };
    };
}
