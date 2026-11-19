{
    den.aspects.emulation = {
	nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                retroarch-free
                steam-rom-manager
                ryubing
                dolphin-emu
                cemu
            ];
            programs.ns-usbloader.enable = true;
        };
    };
}
