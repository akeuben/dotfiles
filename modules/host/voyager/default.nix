{den, ...}: {
    den.aspects.voyager = {
        includes = with den.aspects; [
            feature.core
            feature.desktop
            feature.development
            feature.productivity
        ];
    };
}
