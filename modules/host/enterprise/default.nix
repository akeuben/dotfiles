{den, ...}: {
    den.aspects.enterprise = {
        includes = with den.aspects; [
            hardware.enterprise

            feature.core
            feature.desktop
            feature.development
            feature.productivity
            feature.gaming
        ];
    };
}
