{den, self, ...}: {
    den.aspects.voyager = {
        includes = with den.aspects; [
            hardware.voyager

            feature.core
            feature.desktop
            feature.development
            feature.productivity

            voyager.surface

	    nvim

            kodi
        ];
    };
}
