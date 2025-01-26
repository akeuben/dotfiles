{ ... }: {
    xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.config/hypr/wallpaper.jpeg
    wallpaper = ,~/.config/hypr/wallpaper.jpeg
    splash = true
    '';

    xdg.configFile."hypr/wallpaper.jpeg" = {
        source = ./wallpaper.jpeg;
    };
}
