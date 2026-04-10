{pkgs, ...}: {
    programs.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        portalPackage = pkgs.xdg-desktop-portal-wlr;
        xwayland.enable = true;
    };

    hardware.sensor.iio.enable = true;
}
