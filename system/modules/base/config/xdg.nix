{ pkgs, ... }: let 
    portals = with pkgs; [
            xdg-desktop-portal-hyprland
            xdg-desktop-portal-gtk
            xdg-desktop-portal-gnome
    ];
in {
    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        extraPortals = portals;
        config = {
            common = {
                default = [ "hyprland" "gtk" "gnome" ];
                "org.freedesktop.portal.OpenURI" = [ "gtk" "gnome" ];
            };
        };
    };
    environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
    environment.systemPackages = portals;
}
