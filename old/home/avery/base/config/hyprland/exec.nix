{ inputs, ... }: {
    wayland.windowManager.hyprland.settings.exec-once = [
        "hyprpaper"
        "${inputs.shell.packages.x86_64-linux.desktop}/bin/kappashell-desktop"
        "keepassxc"
        "antimicrox --hidden"
        "vesktop --start-minimized"
        "streamcontroller -b"


        "hyprctl dispatch workspace 1"
    ];
}
