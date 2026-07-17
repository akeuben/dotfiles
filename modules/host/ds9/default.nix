{den, ...}: {
    den.aspects.ds9 = {
        includes = with den.aspects; [
            hardware.ds9
            
            feature.core
            feature.htpc
            feature.gaming
        ];
    };
}
