{ pkgs, ... }: {
    properties = {
        wayland-sessions.session-list = with pkgs; [ hyprland niri ];
        xorg-sessions.session-list = with pkgs; [ i3 ];
    };
}
