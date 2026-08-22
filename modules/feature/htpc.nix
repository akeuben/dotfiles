{den, ...}: {
    den.aspects.feature.htpc = {
        includes = with den.aspects; [
            bigscreen
            graphics
            plymouth
            pipewire
            kodi
        ];

        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                vacuum-tube
            ];
        };
    };
}
