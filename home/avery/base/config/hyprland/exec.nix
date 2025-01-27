{ inputs, ... }: {
    wayland.windowManager.hyprland.settings.exec-once = [
        "hyprpaper"
        "${inputs.shell.packages.x86_64-linux.default}/bin/kappashell"
        "keepassxc"
        "antimicrox --hidden"
        "vesktop --start-minimized"
        "streamcontroller -b"


        "hyprctl dispatch workspace 1"
    ];
}
