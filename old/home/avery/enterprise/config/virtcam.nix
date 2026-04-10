{pkgs, ...}: {
    xdg.desktopEntries.virtcam = {
        name = "Android Virtual Camera";
        exec = "${pkgs.writeScript "virtcam" ''
            ${pkgs.android-tools}/bin/adb start-server
            ${pkgs.scrcpy}/bin/scrcpy --camera-facing=front --video-source=camera --no-audio --v4l2-sink=/dev/video4 -m1024
            ''}";
    };
}
