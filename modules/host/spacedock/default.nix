{den, ...}: {
    den.aspects.spacedock = {
        includes = with den.aspects; [
            hardware.spacedock

            feature.core
            feature.htpc
            emulation
            steam
            xpadneo
        ];
        nixos = {
            services.udev.extraRules = ''
                SUBSYSTEM=="tty", ATTRS{idVendor}=="2548", ATTRS{idProduct}=="1002", GROUP="dialout", MODE="0660"
            '';
        };
    };
}
