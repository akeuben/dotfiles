{den, ...}: {
    den.aspects.feature.development = {
        includes = with den.aspects; [];

        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                godot

                blender
                krita
                mysql-workbench

                ardour
                yabridge
                sfizz
                calf

                vscode
                jetbrains.idea-oss

                cmake
                wget 
                gh
            ];
        };
    };
}
