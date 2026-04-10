{ ... }: let 
    brightness = "1.1";
    saturation = "1.0";
in {
    wayland.windowManager.hyprland.settings = {
        monitor = [
            "DP-1, 2560x1440@165, 0x0, 1, bitdepth, 10"
            "DP-2, 2560x1440@165, 2560x0, 1, bitdepth, 10"
        ];
        render.cm_fs_passthrough = true;
        experimental.xx_color_management_v4 = true;
        debug.full_cm_proto = true;
    };
}
