{ appimageTools, makeDesktopItem, copyDesktopItems, fetchurl}:
let
    pname = "android-messages";
    version = "3.1.0";
    
    src = fetchurl {
        url = "https://github.com/chrisknepper/android-messages-desktop/releases/download/v${version}/Android-Messages-${version}.AppImage";
        hash = "sha256-UTp9hvNWJymBwX50in4G2iPI2P+sr719vL8jzMzQKqU=";
    };
in 
appimageTools.wrapType2 rec {
    inherit pname version src;
    nativeBuildInputs = [
        copyDesktopItems
    ];
    desktopItem = (makeDesktopItem {
        name = "Google Messages";
        exec = "android-messages";
        icon = ./icon.svg;
        desktopName = "Google Messages";
        comment = "Android Messages as a Cross-platform Desktop App";
    });
    extraInstallCommands = ''
    mkdir -p $out/share/applications/
    mkdir -p $out/share/icons/hicolor/scalable/apps/
    install -m 444 -D ${./icon.svg} $out/share/icons/hicolor/scalable/apps/android-messages.svg
    cp ${desktopItem}/share/applications/*.desktop $out/share/applications/
  '';
}
