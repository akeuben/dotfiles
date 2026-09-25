{
    den.aspects.hardware.enterprise = {
        nixos = { config, lib, modulesPath, ... }:{
            imports = [ 
                (modulesPath + "/installer/scan/not-detected.nix")
            ];

            boot.initrd.availableKernelModules = [ "nvme" "ahci" "xhci_pci" "usbhid" "sd_mod" ];
            boot.initrd.kernelModules = [ ];
            boot.kernelModules = [ "kvm-amd" ];
            boot.extraModulePackages = [ ];

            fileSystems."/" =
            { device = "/dev/disk/by-uuid/9192f831-b44c-4b3f-b387-1090c90231e9";
                fsType = "btrfs";
                options = [ "subvol=root" ];
            };

            fileSystems."/nix" =
            { device = "/dev/disk/by-uuid/9192f831-b44c-4b3f-b387-1090c90231e9";
                fsType = "btrfs";
                options = [ "subvol=nix" ];
            };

            fileSystems."/home" =
            { device = "/dev/disk/by-uuid/9192f831-b44c-4b3f-b387-1090c90231e9";
                fsType = "btrfs";
                options = [ "subvol=home" ];
            };

            fileSystems."/boot" =
            { device = "/dev/disk/by-uuid/C357-5F2C";
                fsType = "vfat";
            };

            fileSystems."/mnt/storage" =
            { device = "/dev/disk/by-uuid/b99c7b8b-2428-40d6-afad-4c2efb0354d9";
                fsType = "btrfs";
            };

            swapDevices = [ ];

            networking.useDHCP = lib.mkDefault true;

            nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
            hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
        };
    };
}
