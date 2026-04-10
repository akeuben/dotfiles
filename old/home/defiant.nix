{ inputs, ... }: {
    avery = { 
        imports = [
            inputs.nixCats.homeModule
            inputs.stylix.homeModules.stylix
            ./avery/base
            ./avery/defiant
        ];
    };
}
