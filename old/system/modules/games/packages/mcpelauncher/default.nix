{ appimageTools, fetchurl}:
let
    pname = "mcpelauncher";
    semver = "1.1.1";
    build = "802";

    version = "${semver}-${build}";
    
    src = fetchurl {
        url = "https://github.com/minecraft-linux/appimage-builder/releases/download/v${semver}-${build}/Minecraft_Bedrock_Launcher-x86_64-v${semver}.${build}.AppImage";
        hash = "sha256-lK7c/1ieFGOtWVU0vGKfyQJiBu8NJAQjR0DvpZUE0Ns=";
    };
in 
appimageTools.wrapType2 {
    inherit pname version src;
}
