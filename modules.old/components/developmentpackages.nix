{ self, inputs, ...}: {
    flake.nixosModules.developmentpackages = {pkgs, lib, ...}: {
        environment.systemPackages = with pkgs; [
# Engines
            godot

# Tools
            blender
            krita
            mysql-workbench

# Audio
            ardour
            yabridge
            sfizz
            calf

# Editors
            vscode
            jetbrains.idea-oss

# CLI Utilities
            cmake
            wget 
            git
            gh
        ];
    };
}
