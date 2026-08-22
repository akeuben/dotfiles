{pkgs, inputs, ...}: {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        (callPackage ./packages/mcpelauncher {}) 
        _2ship2harkinian
        (callPackage ./packages/dolphin.nix {})
        pkgs.shipwright
        pkgs.retroarch-full
        steam-rom-manager
        owmods-gui

        mangohud
        ryubing
        steamtinkerlaunch
        (prismlauncher.override {additionalLibs = [ 
            xorg.libXtst 
            xorg.libXi
        ]; jdks = [
            jdk21
            jdk17 
            temurin-jre-bin-8
        ]; })
        pegasus-frontend
        antimicrox
    ] ++ [
        inputs.hytale.packages.x86_64-linux.hytale-launcher
    ];
}
