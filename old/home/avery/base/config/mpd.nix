{ config, ... }: {
    services.mpd = {
        enable = true;
        playlistDirectory = "${config.home.homeDirectory}/.config/mpd/playlists";
        dbFile = "${config.home.homeDirectory}/.config/mpd/tag_cache";
        network = {
            listenAddress = "127.0.0.1";
            port = 6600;
        };
        extraConfig = ''
            log_file           "~/.config/mpd/mpd.log"
            pid_file           "~/.config/mpd/pid"
            state_file         "~/.config/mpd/state"
            audio_output {
                type "pulse"
                name "PulseAudio"
            }
        '';
    };
    services.mpd-mpris.enable = true;
}
