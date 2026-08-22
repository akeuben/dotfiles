{
    den.aspects.pipewire = {
        nixos = {
            services.pipewire = {
                enable = true;
                alsa.enable = true;
                pulse.enable = true;
                jack.enable = true;
                wireplumber.enable = true;
                systemWide = false;
            };

            security.rtkit.enable = true;
        };
    };
}
