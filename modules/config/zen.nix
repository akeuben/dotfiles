{inputs, ...}: {
    den.aspects.zen = {
        provides.to-users.homeManager = {config, pkgs, ...}: {
            imports = [
                inputs.zen-browser.homeModules.beta
            ];

            stylix.targets.zen-browser.profileNames = [ "default" ];

            programs.zen-browser = {
                enable = true;

                setAsDefaultBrowser = true;
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
                };
                profiles."default" = {
                    id = 0;
                    isDefault = true;
                    containersForce = true;
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
                    settings = {
                        "zen.view.sidebar-expanded" = false;
                        "zen.view.use-single-toolbar" = false;
                        "layout.css.prefers-color-scheme.content-override" = 0;
                        "zen.pinned-tab-manager.restore-pinned-tabs-to-pinned-url" = true;
                        "browser.startup.page" = 1;
                        "zen.welcome-screen.seen" = true;
                        "browser.urlbar.placeholderName" = "DuckDuckGo";
                    };
                    extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
                        bitwarden
                        sponsorblock
                        ublock-origin
                    ];
                    spacesForce = true;
                    spaces = let
                        containers = config.programs.zen-browser.profiles."default".containers;
                    in {
                        "Scratch" = {
                            id = "c6de089c-410d-4206-961d-ab11f988d40a";
                            container = containers."Personal".id;
                            icon = "🌲";
                            position = 1000;
                        };
                        "Life" = {
                            id = "8e7068bd-07f5-4b20-8a10-834e2f4d4916";
                            container = containers."Personal".id;
                            icon = "🧑";
                            position = 1100;
                        };
                        "School" = {
                            id = "cdd10fab-4fc5-494b-9041-325e5759195b";
                            container = containers."School".id;
                            icon = "📚";
                            position = 2000;
                        };
                        "Development" = {
                            id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc24";
                            container = containers."Development".id;
                            icon = "💻";
                            position = 3000;
                        };
                    };
                };
            };
        };
    };
}
