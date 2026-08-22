{
    den.aspects.kodi = {
        provides.to-users.homeManager = {osConfig, lib, pkgs, ...}: let
            cfg = osConfig.aspects.kodi;

            kodiMergeFile = pkgs.writers.writePython3Bin "kodi-merge-file" { } ''
                import shutil
                import sys
                import xml.etree.ElementTree as ET
                from pathlib import Path

                ID_ATTRS = ("id", "name")


                def child_key(el):
                    for attr in ID_ATTRS:
                        if attr in el.attrib:
                            return (el.tag, attr, el.attrib[attr])
                    return (el.tag, None, None)


                def merge_element(target, source):
                    # New attributes win; attributes only on target are kept.
                    for k, v in source.attrib.items():
                        target.set(k, v)

                    # Leaf elements (no children): new text wins.
                    if len(list(source)) == 0 and source.text is not None:
                        target.text = source.text

                    by_key = {}
                    for child in list(target):
                        by_key.setdefault(child_key(child), []).append(child)

                    used = set()
                    for schild in list(source):
                        key = child_key(schild)
                        bucket = by_key.get(key, [])
                        tchild = next(
                            (c for c in bucket if id(c) not in used), None
                        )
                        if tchild is not None:
                            used.add(id(tchild))
                            merge_element(tchild, schild)
                        else:
                            target.append(schild)


                def main():
                    target = Path(sys.argv[1])
                    source = Path(sys.argv[2])
                    target.parent.mkdir(parents=True, exist_ok=True)

                    if source.suffix.lower() != ".xml":
                        shutil.copy(source, target)
                    elif target.exists():
                        try:
                            tree = ET.parse(target)
                        except ET.ParseError as e:
                            print(
                                f"kodi-merge-file: existing {target} is not "
                                f"valid XML ({e}), refusing to merge",
                                file=sys.stderr,
                            )
                            sys.exit(1)
                        merge_element(tree.getroot(), ET.parse(source).getroot())
                        tree.write(target, encoding="UTF-8", xml_declaration=True)
                    else:
                        shutil.copy(source, target)

                    target.chmod(0o644)


                if __name__ == "__main__":
                    main()
            '';

            # Emits one merge/overwrite call per (namespace, relPath) pair
            # under a given userdata root ("$HOME/.kodi/userdata" for guest,
            # or a profile's own directory).
            placeFilesScript = targetRoot: pluginConfig: lib.concatStringsSep "\n" (
                lib.flatten (
                    lib.mapAttrsToList (namespace: pcfg:
                        lib.mapAttrsToList (relPath: src: ''
                            $DRY_RUN_CMD ${kodiMergeFile}/bin/kodi-merge-file \
                                "${targetRoot}/addon_data/${namespace}/${relPath}" \
                                "${src}"
                        '') pcfg.additionalFiles
                    ) pluginConfig
                )
            );

            profileXml = idx: p: ''
                <profile>
                <id>${toString idx}</id>
                <name>${p.name}</name>
                <directory pathversion="1">profiles/${p.name}/</directory>
                <thumbnail pathversion="1">${if p.thumbnail != null then toString p.thumbnail else ""}</thumbnail>
                <hasdatabases>false</hasdatabases>
                <canwritedatabases>true</canwritedatabases>
                <hassources>false</hassources>
                <canwritesources>true</canwritesources>
                <lockaddonmanager>false</lockaddonmanager>
                <locksettings>0</locksettings>
                <lockfiles>false</lockfiles>
                <lockmusic>false</lockmusic>
                <lockvideo>false</lockvideo>
                <lockpictures>false</lockpictures>
                <lockprograms>false</lockprograms>
                <lockgames>false</lockgames>
                <lockmode>0</lockmode>
                <lockcode>-</lockcode>
                <lastdate></lastdate>
                </profile>
            '';

            namedProfiles = lib.attrValues cfg.profiles;

            profileEntries = lib.concatStrings (lib.imap1 profileXml namedProfiles);

            profilesXmlContent = ''
                <?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
                <profiles>
                <lastloaded>0</lastloaded>
                <useloginscreen>${if namedProfiles != [ ] then "true" else "false"}</useloginscreen>
                <autologin>0</autologin>
                <nextIdProfile>${toString (1 + lib.length namedProfiles)}</nextIdProfile>
                <profile>
                <id>0</id>
                <name>Guest</name>
                <directory pathversion="1">special://masterprofile/</directory>
                <thumbnail pathversion="1"></thumbnail>
                <hasdatabases>true</hasdatabases>
                <canwritedatabases>true</canwritedatabases>
                <hassources>true</hassources>
                <canwritesources>true</canwritesources>
                <lockaddonmanager>false</lockaddonmanager>
                <locksettings>0</locksettings>
                <lockfiles>false</lockfiles>
                <lockmusic>false</lockmusic>
                <lockvideo>false</lockvideo>
                <lockpictures>false</lockpictures>
                <lockprograms>false</lockprograms>
                <lockgames>false</lockgames>
                <lockmode>0</lockmode>
                <lockcode>-</lockcode>
                <lastdate></lastdate>
                </profile>
                ${profileEntries}
            </profiles>
            '';

            profilesXmlFile = pkgs.writeText "kodi-profiles.xml" profilesXmlContent;

            # Guest/master files, unchanged in spirit from before.
            masterFilesScript = placeFilesScript "$HOME/.kodi/userdata" cfg.pluginConfig;

            # Each named profile now gets a REAL directory with its own
            # merged copy of the files — no more symlink to the shared
            # master addon_data.
            profileFilesScript = p: let
                effectivePluginConfig =
                    lib.recursiveUpdate
                        (if p.inheritPluginConfig then cfg.pluginConfig else { })
                        p.pluginConfig;
            in ''
                $DRY_RUN_CMD mkdir -p "$HOME/.kodi/userdata/profiles/${p.name}"
                ${placeFilesScript "$HOME/.kodi/userdata/profiles/${p.name}" effectivePluginConfig}
            '';

            profileFilesScripts = lib.concatStrings (map profileFilesScript namedProfiles);
        in {
            programs.kodi = {
                enable = true;
                package = osConfig.services.xserver.desktopManager.kodi.package;
                settings = osConfig.aspects.kodi.settings;
            };

            home.activation.kodiPluginDefaultFiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
                ${masterFilesScript}
                ${profileFilesScripts}
            '';

            home.activation.kodiProfilesXml = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
                target="$HOME/.kodi/userdata/profiles.xml"
                if [ ! -e "$target" ]; then
                    $DRY_RUN_CMD mkdir -p "$(dirname "$target")"
                    $DRY_RUN_CMD install -m644 ${profilesXmlFile} "$target"
                fi
            '';

            home.activation.kodiMutablePlugins = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
                addonDir="$HOME/.kodi/addons"
                mkdir -p "$addonDir"

                ${builtins.concatStringsSep "\n" (map (pkg: ''
                    if [ -d "${pkg}/share/kodi/addons" ]; then
                        echo "Installing Kodi addons from ${pkg}"
                        cp -r "${pkg}/share/kodi/addons/"* "$addonDir/"
                        chmod +rw -R $addonDir/*
                    fi
                '') osConfig.aspects.kodi.mutablePlugins)}
            '';
        };

        nixos = {lib, ...}: let
            inherit (lib)
                mkEnableOption
                mkOption
                types;

            pluginModule = types.submodule ({ ... }: {
                options = {
                    additionalFiles = mkOption {
                        type = types.attrsOf types.path;
                        default = { };
                        example = {
                            "settings.xml" = ./settings.xml;
                        };
                        description = ''
                        Extra files copied into the plugin directory.
                        Keys are paths relative to the plugin root.
                        '';
                    };
                };
            });

            profileModule = types.submodule ({ ... }: {
                options = {
                    name = mkOption {
                        type = types.str;
                    };

                    thumbnail = mkOption {
                        type = types.nullOr types.path;
                        default = null;
                    };

                    inheritPluginConfig = mkOption {
                        type = types.bool;
                        default = false;
                    };

                    pluginConfig = mkOption {
                        type = types.attrsOf pluginModule;
                        default = { };
                    };
                };
            });
        in {
            options.aspects.kodi = {
                enable = mkEnableOption "Kodi";

                plugins = mkOption {
                    type = types.listOf types.package;
                    default = [ ];
                    description = "Kodi plugins to install.";
                };

                mutablePlugins = mkOption {
                    type = types.listOf types.package;
                    default = [ ];
                    description = "Kodi plugins to install by copy allowing for mutation at runtime.";
                };

                pluginConfig = mkOption {
                    type = types.attrsOf pluginModule;
                    default = { };
                };

                settings = mkOption {
                    type = with types; let
                        valueType = oneOf [
                            str
                            (attrsOf valueType)
                            (listOf valueType)
                        ] // {
                            description = "attribute sets or lists of strings";
                        };
                    in
                        nullOr valueType;
                    default = { };
                    description = "Contents of advancedsettings.xml.";
                };

                profiles = mkOption {
                    type = types.attrsOf profileModule;
                    default = { };
                    description = "Kodi profiles keyed by profile slug.";
                };
            };
        };
    };
}
