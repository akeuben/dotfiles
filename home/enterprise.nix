{ inputs, ... }: {
    avery = { 
        imports = [
            inputs.nixCats.homeModule
            inputs.zen-browser.homeModules.beta
            inputs.stylix.homeManagerModules.stylix
            ./avery/base
            ./avery/enterprise
        ];
    };
}
