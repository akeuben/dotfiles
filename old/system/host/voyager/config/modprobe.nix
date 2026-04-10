{...}: {
    boot.extraModprobeConfig = ''
        softdep soc_button_array pre: pinctrl_icelake
    '';
}
