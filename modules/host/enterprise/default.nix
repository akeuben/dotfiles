{den, ...}: {
    den.aspects.enterprise = {
        includes = with den.aspects; [
            hardware.enterprise

            openrgb
            vr

            feature.core
            feature.desktop
            feature.development
            feature.productivity
            feature.gaming
        ];
    };
}
