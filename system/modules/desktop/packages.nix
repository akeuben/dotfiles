{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        nautilus
        vesktop
        kitty
        gsettings-desktop-schemas
        wl-clipboard
        
        mpv
        g4music
        obs-studio
        amberol
        gthumb
        pavucontrol
        
        libreoffice-fresh       
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
        muse-sounds-manager

        alsa-oss
        faudio
        zenity

        niri

        (callPackage ./packages/zen-browser {}) 
    ];

    fonts.packages = with pkgs; [
        helvetica-neue-lt-std
        noto-fonts
        noto-fonts-emoji
        font-awesome
        font-awesome_5
    ];
}
