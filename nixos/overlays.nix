{...}: {
  nixpkgs.overlays = [
    (final: prev: {
      biome = prev.biome.overrideAttrs (old: {
        version = "2.3.0";
        src = prev.fetchFromGitHub {
          owner = "biomejs";
          repo = "biome";
          rev = "@biomejs/biome@2.3.0";
          hash = "sha256-VBNFQkgruomZjDaQouR4KZooGNN/0VCRYFRomdhPFF8=";
        };
      });
    })
  ];
}
