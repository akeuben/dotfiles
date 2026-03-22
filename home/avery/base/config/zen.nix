{config, ...}: {
    programs.zen-browser = let
        mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
            installation_mode = "force_installed";
        });

        containers = {
            Personal = {
                color = "green";
                icon = "tree";
                id = 1;
            };
            School = {
                color = "red";
                icon = "briefcase";
                id = 2;
            };
            Development = {
                color = "blue";
                icon = "circle";
                id = 3;
            };
        };
        spaces = {
            Scratch = {
                id = "c6de089c-410d-4206-961d-ab11f988d40a";
                container = containers.Personal.id;
                icon = "🌲";
                position = 100;
            };
            Life = {
                id = "8e7068bd-07f5-4b20-8a10-834e2f4d4916";
                container = containers.Personal.id;
                icon = "🧑";
                position = 200;
            };
            School = {
                id = "cdd10fab-4fc5-494b-9041-325e5759195b";
                container = containers.School.id;
                icon = "📚";
                position = 300;
            };
            Development = {
                id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc24";
                container = containers.Development.id;
                icon = "💻";
                position = 400;
            };
        };
        pins = {
            "myucalgary" = {
                id = "079616c5-1ba1-4ac7-a73e-edd58fa24000";
                container = containers.School.id;
                url = "https://my.ucalgary.ca";
                isEssential = true;
                position = 101;
            };
            "d2l" = {
                id = "079616c5-1ba1-4ac7-a73e-edd58fa24001";
                container = containers.School.id;
                url = "https://d2l.ucalgary.ca";
                isEssential = true;
                position = 102;
            };
            "tophat" = {
                id = "079616c5-1ba1-4ac7-a73e-edd58fa24002";
                container = containers.School.id;
                url = "https://app-ca.tophat.com/e";
                isEssential = true;
                position = 103;
            };
            "outlook" = {
                id = "079616c5-1ba1-4ac7-a73e-edd58fa24003";
                container = containers.School.id;
                url = "https://outlook.live.com/mail/0";
                isEssential = true;
                position = 104;
            };
            "csgit" = {
                id = "079616c5-1ba1-4ac7-a73e-edd58fa24004";
                container = containers.School.id;
                url = "https://csgit.ucalgary.ca";
                isEssential = true;
                position = 105;
            };
            "gmail" = {
                id = "079616c5-1ba1-4ac7-a73e-edd58fa24005";
                container = containers.Personal.id;
                url = "https://mail.google.com";
                isEssential = true;
                position = 201;
            };
            "eqbank" = {
                id = "079616c5-1ba1-4ac7-a73e-edd58fa24006";
                container = containers.Personal.id;
                url = "https://www.eqbank.ca";
                isEssential = true;
                position = 202;
            };
            "td" = {
                id = "079616c5-1ba1-4ac7-a73e-edd58fa24007";
                container = containers.Personal.id;
                url = "https://easyweb.td.com";
                isEssential = true;
                position = 203;
            };
            "github" = {
                id = "079616c5-1ba1-4ac7-a73e-edd58fa24008";
                container = containers.Development.id;
                url = "https://github.com";
                isEssential = true;
                position = 301;
            };
            "chatgpt" = {
                id = "079616c5-1ba1-4ac7-a73e-edd58fa24009";
                container = containers.Development.id;
                url = "https://chatgpt.com";
                isEssential = true;
                position = 302;
            };
        };
        
    in {
        enable = true;
        policies = {
            AutofillAddressEnabled = false;
            AutofillCreditCardEnabled = false;
            DisableAppUpdate = true;
            DisableFeedbackCommands = true;
            DisableFirefoxStudies = true;
            DisablePocket = true;
            DisableTelemetry = true;
            DontCheckDefaultBrowser = true;
            NoDefaultBookmarks = true;
            OfferToSaveLogins = false;
            EnableTrackingProtection = {
                Value = true;
                Locked = true;
                Cryptomining = true;
                Fingerprinting = true;
            };
            SearchEngines = {
                Default = "DuckDuckGo";
                Remove = ["Google" "eBay" "Wikipedia (en)" "Bing"];
            };
            ExtensionSettings = mkExtensionSettings {
                "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
                "uBlock0@raymondhill.net" = "ublock-origin";
            };
        };
        profiles."default" = {
            containersForce = true;
            spacesForce = true;
            pinsForce = true;
            inherit containers pins spaces;

            settings = {
                "zen.view.sidebar-expanded" = false;
                "zen.view.use-single-toolbar" = false;
                "layout.css.prefers-color-scheme.content-override" = 0;
                "zen.pinned-tab-manager.restore-pinned-tabs-to-pinned-url" = true;
                "browser.startup.page" = 1;
                "zen.welcome-screen.seen" = true;
                "browser.urlbar.placeholderName" = "DuckDuckGo";
            };
        };
    };
}
