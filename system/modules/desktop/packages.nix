{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        nautilus
        vesktop
        kitty
        gsettings-desktop-schemas
        
        mpv
        g4music
        obs-studio
        amberol
        gthumb
        pavucontrol
        
        libreoffice-fresh       
        calibre
        pinta
        tagger
        gimp
        inkscape

        ulauncher

        hyprpaper
        hyprlock
        hypridle
        hyprpicker

        papirus-folders
        catppuccin-cursors.mochaLight
        adw-gtk3

        bluetuith

        swappy
        slurp
        grim

        gnome-keyring
        xdg-utils
        musescore
        muse-sounds-manager

        alsa-oss
        faudio
        zenity

        niri
    ];

    fonts.packages = with pkgs; [
        helvetica-neue-lt-std
        noto-fonts
        noto-fonts-emoji
        font-awesome
        font-awesome_5
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
}
