{self, ...}: {
    den.aspects.kodi = {
        nixos = {pkgs, config, host, ...}: {
            services.xserver.enable = true;
            services.xserver.desktopManager.kodi = {
                enable = true;
                package = pkgs.kodi.withPackages (p: config.aspects.kodi.plugins);
            };

            aspects.kodi = {
                enable = true;
                plugins = with pkgs.kodiPackages; with self.packages.${pkgs.stdenv.hostPlatform.system}; [
                    trakt

                    # Arctic Fuse 3 deps
                    kodi-weathericons-white
                    kodi-studios-coloured
                    kodi-robotocjksc
                    kodi-themoviedb-helper
                    kodi-skinvariables
                    signals
                    kodi-qrcode
                    texturemaker

                    kodi-openmeteo
                    kodi-pytz
                    requests
                    dateutil
                ];

                mutablePlugins = with self.packages.${pkgs.stdenv.hostPlatform.system}; [
                    kodi-arctic-fuse-3
                ];

                profiles = let 
                    userPluginConfig = {
                        "skin.arctic.fuse.3".additionalFiles."settings.xml" = ./addon_data/skin.arctic.fuse.3/settings.xml;
                        "script.skinvariables".additionalFiles."nodes/skin.arctic.fuse.3/skinvariables-shortcut-homesubmenu.json" = ./addon_data/script.skinvariables/nodes/skin.arctic.fuse.3/skinvariables-shortcut-homesubmenu.json;
                        "script.skinvariables".additionalFiles."nodes/skin.arctic.fuse.3/skinvariables-shortcut-powermenu.json" = ./addon_data/script.skinvariables/nodes/skin.arctic.fuse.3/skinvariables-shortcut-powermenu.json;
                        "script.skinvariables".additionalFiles."nodes/skin.arctic.fuse.3/skinvariables-shortcut-searchwidgets.json" = ./addon_data/script.skinvariables/nodes/skin.arctic.fuse.3/skinvariables-shortcut-searchwidgets.json;
                    };
                in {
                    "Avery" = {
                        name = "Avery";
                        pluginConfig = userPluginConfig;
                    };
                    "Abbey" = {
                        name = "Abbey";
                        pluginConfig = userPluginConfig;
                    };
                    "Serena" = {
                        name = "Serena";
                        pluginConfig = userPluginConfig;
                    };
                    "Chris" = {
                        name = "Chris";
                        pluginConfig = userPluginConfig;
                    };
                };

                settings = {
                    lookandfeel = {
                        skin = "skin.arctic.fuse.3";
                        skintheme = "SKINDEFAULT";
                        skincolors = "SKINDEFAULT";
                        font = "Default";
                        skinzoom = "0";
                        stereostrength = "5";
                    };
                    locale = {
                        language = "resource.language.en_us";
                        charset = "DEFAULT";
                        country = "Canada";
                        audiolanguage = "mediadefault";
                        subtitlelanguage = "original";
                    };
                    scrapers = {
                        moviesdefault = "metadata.themoviedb.org.python";
                        tvshowsdefault = "metadata.tvshows.themoviedb.org.python";
                    };
                    services.devicename = host.name;
                    weather = {
                        addon = "weather.openmeteo";
                    };
                    general = {
                        addonupdates = "2";
                        addonnotifcations = "false";
                    };
                    addons.unknownsources = "true";
                };

                pluginConfig = {
                    "skin.arctic.fuse.3".additionalFiles."settings.xml" = ./addon_data/skin.arctic.fuse.3/settings.xml;
                    "script.skinvariables".additionalFiles."nodes/skin.arctic.fuse.3/skinvariables-shortcut-homesubmenu.json" = ./addon_data/script.skinvariables/nodes/skin.arctic.fuse.3/skinvariables-shortcut-homesubmenu.json;
                    "script.skinvariables".additionalFiles."nodes/skin.arctic.fuse.3/skinvariables-shortcut-powermenu.json" = ./addon_data/script.skinvariables/nodes/skin.arctic.fuse.3/skinvariables-shortcut-powermenu.json;
                    "script.skinvariables".additionalFiles."nodes/skin.arctic.fuse.3/skinvariables-shortcut-searchwidgets.json" = ./addon_data/script.skinvariables/nodes/skin.arctic.fuse.3/skinvariables-shortcut-searchwidgets.json;
                };
            };
        };
    };
}
