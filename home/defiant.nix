{ inputs, ... }: {
    avery = { 
        imports = [
            inputs.nixvim.homeManagerModules.nixvim
            ./avery/base
            ./avery/defiant
        ];
    };
}
