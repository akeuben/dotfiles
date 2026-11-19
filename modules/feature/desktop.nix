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

        nixos = {pkgs, config, ...}: {
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
            services.displayManager.enable = true;
            environment.sessionVariables.XDG_DATA_DIRS = [
                "${config.services.displayManager.sessionData.desktops}/share"
            ];
        };
    };
}
