{ self, inputs, ...}: {
    flake.nixosModules.swap = {pkgs, lib, ...}: {
        swapDevices = [{
            device = "/swapfile";
            size = 16 * 1024; # 16 GB
        }];
    };
}

