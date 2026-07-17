{self, inputs, ...}: {
    flake.nixosModules.feature-development = { config, lib, pkgs, modulesPath, ... }: {
        imports = with self.nixosModules; [
            tmux
            neofetch
        ];

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
                git
                gh
            ];
        };
    };
}

