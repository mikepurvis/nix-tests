pkgs: src: outputHash: path:
  pkgs.stdenvNoCC.mkDerivation {
    inherit src outputHash path;
    name = "source";
    coreutils = pkgs.coreutils;
    builder = builtins.toFile "builder.sh" ''
      $coreutils/bin/cp -a $src/$path $out
    '';
    outputHashAlgo = "sha256";
    outputHashMode = "recursive";
  }
