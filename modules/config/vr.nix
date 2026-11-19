{den, inputs, ...}: {
    den.aspects.vr = {
        nixos = {pkgs, config, lib, ...}: {
            environment.systemPackages = with pkgs; [
                iw
                bs-manager
            ];
            boot.kernelParams = [ "cfg80211.ieee80211_regdom=US" ];
            hardware.wirelessRegulatoryDatabase = true;

            boot.extraModulePackages = let 
                kernel = config.boot.kernelPackages.kernel;
            in [
                (config.boot.kernelPackages.kernel.stdenv.mkDerivation {
                    pname = "rtw89-morrownr-debugfs";
                    version = "unstable-morrownr";

                    src = pkgs.fetchFromGitHub {
                        owner = "morrownr";
                        repo = "rtw89";
                        rev = "de95a4d4eab9d2d0d75fed5c95f9854969595579";
                        hash = "sha256-ZRoituDx8S6nG5o1zDvWA8yZW8h+7rp/xAIaQj4nb6E=";
                    };
                    nativeBuildInputs = config.boot.kernelPackages.kernel.moduleBuildDependencies;

                    buildPhase = ''
                    runHook preBuild
                    make -C ${config.boot.kernelPackages.kernel.dev}/lib/modules/${config.boot.kernelPackages.kernel.modDirVersion}/build M=$PWD modules
                    runHook postBuild
                     '';

                    installPhase = ''
                    runHook preInstall

                    # Create target module directory in the Nix store output
                    MODDIR=$out/lib/modules/${config.boot.kernelPackages.kernel.modDirVersion}/kernel/drivers/net/wireless/realtek/rtw89
                    mkdir -p $MODDIR

                    # Copy and rename Morrownr's _git modules to standard kernel names
                    for ko in *.ko; do
                        target_name=$(echo "$ko" | sed 's/_git//')
                        cp "$ko" "$MODDIR/$target_name"
                    done

                    runHook postInstall
                    '';
                })
                (pkgs.stdenv.mkDerivation {
                    pname = "amdgpu-kernel-module";
                    inherit (kernel) src version postPatch nativeBuildInputs;

                    kernel_dev = kernel.dev;
                    kernelVersion = kernel.modDirVersion;

                    patches = [
                        (pkgs.fetchpatch {
                            name = "cap_sys_nice_begone.patch";
                            url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
                            hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
                        })
                    ];
                    
                    modulePath = "drivers/gpu/drm/amd/amdgpu";

                    buildPhase = ''
                        BUILT_KERNEL=$kernel_dev/lib/modules/$kernelVersion/build

                        cp $BUILT_KERNEL/Module.symvers .
                        cp $BUILT_KERNEL/.config        .
                        cp $kernel_dev/vmlinux          .

                        make "-j$NIX_BUILD_CORES" modules_prepare
                        make "-j$NIX_BUILD_CORES" M=$modulePath modules
                        '';

                    installPhase = ''
                        make \
                        INSTALL_MOD_PATH="$out" \
                        XZ="xz -T$NIX_BUILD_CORES" \
                        M="$modulePath" \
                        modules_install
                        '';

                    meta = {
                        description = "AMD GPU kernel module";
                        license = lib.licenses.gpl3;
                    };
                })
            ];

            # Ensure the custom modules load automatically on boot and disable stock ones
            boot.kernelModules = [ "rtw89_core" "rtw89_8852cu" ];
            boot.blacklistedKernelModules = [ ];

            systemd.user.services.vr-realtek-wifi-toggle = {
                description = "Auto-toggle Realtek Wi-Fi low-latency tweaks for SteamVR";
                wantedBy = [ "graphical-session.target" ];
                path = with pkgs; [ 
                    bash
                    procps     
                    sudo   
                    iw         
                    coreutils    
                    findutils    
                    gnugrep      
                ];
                script = ''
                    while true; do
                        if pgrep -x "vrserver" > /dev/null; then
                            PATH="/run/wrappers/bin:$PATH" ${./holo-realtek-firmware-toggles} set-low-latency-mode on 2>&1

                            while pgrep -x "vrserver" > /dev/null; do
                                sleep 30
                            done

                            PATH="/run/wrappers/bin:$PATH" ${./holo-realtek-firmware-toggles} reset 2>&1
                        fi
                        sleep 30
                    done
                '';
                serviceConfig = {
                    Restart = "always";
                    RestartSec = "30s";
                };
            };
        };
        provides.to-users.homeManager = {pkgs, config, ...}: {
            xdg.configFile."openxr/1/active_runtime.json".source =
                config.lib.file.mkOutOfStoreSymlink
                "${config.home.homeDirectory}/.local/share/Steam/steamapps/common/SteamVR/steamxr_linux64.json";
        };
    };
}
