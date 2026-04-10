{ pkgs, ... }: {
    properties = {
        wayland-sessions.session-list = [ pkgs.hyprland pkgs.niri ];
        xorg-sessions.session-list = with pkgs; [ i3 ];
    };
}
