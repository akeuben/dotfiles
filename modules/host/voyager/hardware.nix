{
    den.aspects.hardware.voyager = {
        nixos = {config, lib, modulesPath, ...}: {
            imports =[ 
                (modulesPath + "/installer/scan/not-detected.nix")
            ];

            boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "uas" "sd_mod" ];
            boot.initrd.kernelModules = [ ];
            boot.kernelModules = [ "kvm-intel" ];
            boot.extraModulePackages = [ ];

            fileSystems."/" =
            { device = "/dev/disk/by-uuid/9f58c9e4-c645-4022-9e85-ad1c941281c1";
                fsType = "btrfs";
                options = [ "subvol=@" ];
            };

            fileSystems."/boot" =
            { device = "/dev/disk/by-uuid/1581-38B1";
                fsType = "vfat";
                options = [ "fmask=0077" "dmask=0077" ];
            };

            swapDevices = [ ];

            networking.useDHCP = lib.mkDefault true;

            nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
            hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
        };
    };
}
