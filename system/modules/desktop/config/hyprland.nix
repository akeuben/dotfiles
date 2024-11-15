{inputs, pkgs, ...}: {
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        portalPackage = pkgs.xdg-desktop-portal-wlr;
        xwayland.enable = true;
    };

    hardware.sensor.iio.enable = true;
}
