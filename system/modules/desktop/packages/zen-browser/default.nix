{ appimageTools, makeDesktopItem, copyDesktopItems, fetchurl}:
let
    pname = "zen-browser";
    version = "1.8.2b";
    
    src = fetchurl {
        url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen-x86_64.AppImage";
        hash = "sha256-hZiJ8JLzLhtD1W8DAso3yBAJYhFE+nJEbQJa59AWjnU=";
    };
in 
appimageTools.wrapType2 rec {
    inherit pname version src;
    nativeBuildInputs = [
        copyDesktopItems
    ];
    desktopItem = (makeDesktopItem {
        name = "Zen Browser";
        exec = "zen-browser";
        icon = ./zen-dark.svg;
        desktopName = "Zen Browser";
        comment = "A calmer internet, without any gimmicks.";
    });
    extraInstallCommands = ''
    mkdir -p $out/share/applications/
    mkdir -p $out/share/icons/hicolor/256x256/apps/
    install -m 444 -D ${./zen-dark.svg} $out/share/icons/hicolor/scalable/apps/zen-browser.svg
    cp ${desktopItem}/share/applications/*.desktop $out/share/applications/
  '';
}
