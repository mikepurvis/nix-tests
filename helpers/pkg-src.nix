{ stdenvNoCC, coreutils, src }:
  outputHash: path:
    stdenvNoCC.mkDerivation {
      inherit coreutils src outputHash path;
      name = "source";
      builder = builtins.toFile "builder.sh" ''
        $coreutils/bin/cp -a $src/$path $out
      '';
      outputHashAlgo = "sha256";
      outputHashMode = "recursive";
    }
