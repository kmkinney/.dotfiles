{...}: {
  nixpkgs.overlays = [
    (final: prev: {
      biome = prev.biome.overrideAttrs (old: rec {
        version = "2.3.0";
        src = prev.fetchFromGitHub {
          owner = "biomejs";
          repo = "biome";
          rev = "@biomejs/biome@2.3.0";
          hash = "sha256-SrEPwto4btTE6bzgQcQvm4A1MciCrgz+UVCgJS+WIEw=";
        };
        cargoDeps = old.cargoDeps.overrideAttrs (prev.lib.const {
          name = "biome-vendor.tar.gz";
          inherit src;
          outputHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        });
      });
    })
  ];
}
