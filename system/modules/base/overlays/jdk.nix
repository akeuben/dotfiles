{ ... } : {
    nixpkgs.overlays = [
      (final: prev: {
        jre8 = builtins.trace "test" final.temurin-bin-8;
      })
    ];
}
