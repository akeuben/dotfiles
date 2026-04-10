{ inputs, ... }: {
    avery = { 
        imports = [
            inputs.nixCats.homeModule
            inputs.zen-browser.homeModules.beta
            inputs.stylix.homeModules.stylix
            ./avery/base
            ./avery/voyager
        ];
    };
}
