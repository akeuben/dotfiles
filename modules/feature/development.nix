{den, ...}: {
    den.aspects.feature.development = {
        includes = with den.aspects; [];

        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                godot

                blender
                krita

                ardour
                yabridge
                sfizz
                calf

                vscode
                jetbrains.idea

                cmake
                wget 
                gh
            ];
        };
    };
}
