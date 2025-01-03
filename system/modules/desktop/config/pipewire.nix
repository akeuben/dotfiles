{pkgs-unstable, ...}: {
    services.pipewire = {
        enable = true;
        package = pkgs-unstable.pipewire;
        alsa.enable = true;
        pulse.enable = true;
        jack.enable = true;
        wireplumber.enable = true;
        systemWide = false;
    };
    
    # Enables the realtimekit system service used by pulseaudio
    security.rtkit.enable = true;
}
