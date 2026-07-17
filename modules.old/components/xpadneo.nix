{self, inputs, ...}: {
    flake.nixosModules.xpadneo = {}: {
        hardware.xpadneo.enable = true;
    };
}
