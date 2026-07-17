{self, inputs, ...}: {
    flake.nixosModules.emulation = {pkgs, lib, ...}: {
        environment.systemPackages = with pkgs; [
            _2ship2harkinian
            shipwright
            retroarch-free
            steam-rom-manager
            ryubing
            dolphin-emu
        ];
    };
}
