{ inputs, ... }: {
    avery = { 
        imports = [
            inputs.nixvim.homeManagerModules.nixvim
            inputs.stylix.homeManagerModules.stylix
            ./avery/base
            ./avery/voyager
        ];
    };
}
