pkgs: src: outputHash: path:
  pkgs.stdenvNoCC.mkDerivation {
    inherit src outputHash path;
    name = "source";
    builder = builtins.toFile "builder.sh" ''
      $pkgs.coreutils/bin/cp -a $src/$path $out
    '';
    outputHashAlgo = "sha256";
    outputHashMode = "recursive";
  }
