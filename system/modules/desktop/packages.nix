{inputs, pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        nautilus
        vesktop
        discord
        kitty
        gsettings-desktop-schemas
        wl-clipboard
        
        mpv
        spotify
        g4music
        rhythmbox
        obs-studio
        amberol
        gthumb
        pavucontrol
        
        libreoffice-still
        pinta
        tagger
        gimp
        inkscape

        hyprpaper
        hyprlock
        hypridle
        hyprpicker

        papirus-folders
        adw-gtk3

        bluetuith

        swappy
        slurp
        grim

        gnome-keyring
        xdg-utils
        musescore
        ente-auth

        alsa-oss
        faudio
        zenity

        niri

        (callPackage ./packages/android-messages {}) 
        caprine-bin
    ];

    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-emoji
        font-awesome
        font-awesome_5
    ];
}
