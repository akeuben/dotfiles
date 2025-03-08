{ config, ... }: {
    xdg.configFile."hypr/hyprpaper.conf".text = ''
<<<<<<< Updated upstream
    preload = ${config.stylix.image}
    wallpaper = ,${config.stylix.image}
    splash = true
=======
        preload = ${./wallpaper.jpeg}
        wallpaper = ,${./wallpaper.jpeg}
        splash = true
>>>>>>> Stashed changes
    '';
}
