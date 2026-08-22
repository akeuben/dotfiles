{pkgs, config, ...}: {
    boot = {
        kernelModules = [ "v4l2loopback" ];
        extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
        extraModprobeConfig = ''
            options v4l2loopback video_nr=10 card_label="VirtualCam" exclusive_caps=1
        '';
    };
}
