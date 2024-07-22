{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "everforest-dark";

  src = pkgs.fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Everforest-GTK-Theme";
    rev = "b3af23bc47ce7a15487eb273b12a5dc2a3566621";
    sha256 = pkgs.lib.fakeSha256;
  };

  installPhase = ''
    mkdir -p $out
    cp -r $src $out
  '';
}
