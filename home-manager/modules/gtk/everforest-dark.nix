{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "everforest-dark";

  src = pkgs.fetchurl {
    url = "https://github.com/kmkinney/.dotfiles/blob/9a74f998f5a5b7fc10fdde1962cf37b414b14d68/home-manager/modules/gtk/Everforest-Dark-BL.zip";
    sha256 = "sha256-V5426nC7f66AiQXgityYddyuvQa4mPdyBkKsH1PAUJM=";
    # sha256 = pkgs.lib.fakeSha256;
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip $src -d $out/
  '';
}
