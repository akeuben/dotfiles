{ pkgs, ... }: {
    wayland.windowManager.hyprland = {
        settings = {
            monitor = [
                "eDP-1,2736x1824,0x0,1.9,vrr,1"
                ",preferred,auto,1"
            ];
            exec-once = [
                "iio-hyprland"
                "/home/avery/.config/hypr/rotate.sh"
            ];
            bindl = [
                ",switch:on:Lid Switch,exec,/home/avery/.config/hypr/lock.sh"
                ",switch:on:Lid Switch,exec,${pkgs.brightnessctl}/bin/brightnessctl -s"
                ",switch:on:Lid Switch,exec,${pkgs.brightnessctl}/bin/brightnessctl s 0%"
                ",switch:off:Lid Switch,exec,${pkgs.brightnessctl}/bin/brightnessctl -r"
            ];
            plugin = {
                touch_gestures = {
                    sensitivity = 4.0;
                    workspace_swipe_fingers = 3;
                    long_press_delay = 400;
                    resize_on_border_long_press = true;
                };
            };
            input.touchdevice.output = "eDP-1";
            input.tablet.output = "eDP-1";
        };
        plugins = with pkgs.hyprlandPlugins; [
            hyprgrass
        ];
    };

}
