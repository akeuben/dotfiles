{den, ...}: {
    den.aspects.feature.desktop = {
        includes = with den.aspects; [
            hypr
            kitty
            graphics
            musescore
            evolution
            kdeconnect
            pipewire
            vesktop
            zen
        ];

        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                nautilus
                mpv
                gthumb

                tagger
                krita
                obs-studio

                ente-auth
                bitwarden-desktop 

                xdg-utils
                alsa-oss
                pavucontrol
                faudio
                zenity
            ];
        };
    };
}
