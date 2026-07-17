{...}: {
    flake.nixosModules.host-ds9-hardware = { config, lib, modulesPath, ... }: {
        imports = [ 
            (modulesPath + "/installer/scan/not-detected.nix")
        ];

	boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-intel" ];
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

	fileSystems."/nix" =
	{ device = "/dev/disk/by-label/nix";
		fsType = "btrfs";
	};

	fileSystems."/home" =
	{ device = "/dev/disk/by-label/home";
		fsType = "btrfs";
	};

	swapDevices = [ ];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
