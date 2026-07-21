{
    den.aspects.hardware.spacedock = {
        nixos = { config, lib, modulesPath, ... }: {
            imports = [ 
                (modulesPath + "/installer/scan/not-detected.nix")
            ];

            boot.initrd.availableKernelModules = [ "nvme" "ahci" "xhci_pci" "usbhid" "sd_mod" ];
            boot.initrd.kernelModules = [ ];
            boot.kernelModules = [ "kvm-amd" ];
            boot.extraModulePackages = [ ];

            fileSystems."/" =
            { device = "/dev/disk/by-label/root";
                fsType = "btrfs";
            };

            fileSystems."/boot" =
            { device = "/dev/disk/by-label/boot";
                fsType = "vfat";
                options = [ "fmask=0022" "dmask=0022" ];
            };

            swapDevices = [ ];

            networking.useDHCP = lib.mkDefault true;

            nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
            hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
        };
    };
}
