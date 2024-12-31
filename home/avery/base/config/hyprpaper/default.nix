{ ... }: {
    xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.config/hypr/wallpaper.jpg
    wallpaper = ,~/.config/hypr/wallpaper.jpg
    splash = true
    '';

    xdg.configFile."hypr/wallpaper.jpg" = {
        source = ./wallpaper.jpg;
    };
}
