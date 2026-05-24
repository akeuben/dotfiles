{ self, inputs, ... }: {
    flake.nixosModules.tmux = { pkgs, lib, ... }: {
        environment.systemPackages = [
            self.packages.${pkgs.stdenv.system}.tmux
        ];
    };

    perSystem = { pkgs, lib, self', ...}: {
        packages.tmux = inputs.wrapper-modules.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.tmux;

            addFlag = [
                "-f"
                ./tmux.conf
            ];

            prefixVar = [
                [
                    "PATH"
                    ":"
                    "${lib.makeBinPath (with pkgs; [
                        tmux-sessionizer
                    ])}"
                ]
            ];
            
        };
    };
}

