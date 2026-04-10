{...}: {
    services.iptsd = {
        enable = true;
        config = {
            Touchscreen = {
                DisableOnStylus = true;
                DisableOnPalm = true;
            };
        };
    };
}
