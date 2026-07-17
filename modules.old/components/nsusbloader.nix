{self, inputs, ...}: {
    flake.nixosModules.nsusbloader = {...}: {
        programs.ns-usbloader.enable = true;
    };
}
