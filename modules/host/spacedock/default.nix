{den, ...}: {
    den.aspects.spacedock = {
        includes = with den.aspects; [
            hardware.spacedock

            feature.core
            feature.htpc
            feature.gaming
        ];
    };
}
