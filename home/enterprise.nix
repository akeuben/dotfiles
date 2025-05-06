{ inputs, ... }: {
    avery = { 
        imports = [
            inputs.nixCats.homeModule
            inputs.stylix.homeManagerModules.stylix
            ./avery/base
            ./avery/enterprise
        ];
    };
}
