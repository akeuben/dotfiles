{ inputs, nixpkgs, nixpkgs-unstable, user, home-manager, nixos-hardware, stylix, ... }:

let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
    };

    pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
    };

    lib = nixpkgs.lib;
in {
    enterprise = lib.nixosSystem {
        inherit system;
        specialArgs = {
            inherit inputs pkgs-unstable user system;
            hostName = "enterprise";
        };
        modules = [
            ./enterprise
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users = (import ../../home/enterprise.nix {
                    inherit lib inputs pkgs pkgs-unstable user home-manager;
                });
                home-manager.extraSpecialArgs = {
                    inherit inputs;
                };
            }
        ];
    };
    defiant = lib.nixosSystem {
        inherit system;
        specialArgs = {
            inherit inputs pkgs-unstable user system;
            hostName = "defiant";
        };
        modules = [
            ./defiant
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users = (import ../../home/defiant.nix {
                    inherit lib inputs pkgs pkgs-unstable user home-manager;
                });
                home-manager.extraSpecialArgs = {
                    inherit inputs;
                };
            }
        ];
    };
    voyager = lib.nixosSystem {
        inherit system;
        specialArgs = {
            inherit inputs pkgs-unstable user system;
            hostName = "voyager";
        };
        modules = [
            nixos-hardware.nixosModules.microsoft-surface-pro-intel
            ./voyager
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users = (import ../../home/voyager.nix {
                    inherit lib inputs pkgs pkgs-unstable user home-manager;
                });
                home-manager.extraSpecialArgs = {
                    inherit inputs;
                };
            }
        ];
    };
    discovery = lib.nixosSystem {
        inherit system;
        specialArgs = {
            inherit inputs pkgs-unstable user system;
            host = {
                hostName = "discovery";
            };
        };
        modules = [
            ./discovery
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users = (import ../../home/enterprise.nix {
                    inherit lib inputs pkgs pkgs-unstable user home-manager;
                });
                home-manager.extraSpecialArgs = {
                    inherit inputs;
                };

            }
        ];
    };
}
