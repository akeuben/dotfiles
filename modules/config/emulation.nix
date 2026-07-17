{
    den.aspects.emulation = {
        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                _2ship2harkinian
                shipwright
                retroarch-free
                steam-rom-manager
                ryubing
                dolphin-emu
                cemu
            ];
        };
    };
}
