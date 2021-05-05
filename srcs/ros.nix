{ fetchFromGitHub, stdenvNoCC, coreutils }:

let
  pname = "ros";

  src = fetchFromGitHub {
    owner = "ros";
    repo = "ros";
    rev = "a8851ec7f44d2d20498f74b090b05841e930613e";
    sha256 = "2s5ygezK2vPfjIXqk4PGoXsIVuv42dac8nW47rxwOPs=";
  };

  rosbash = stdenvNoCC.mkDerivation {
    name = "rosbash-src";
    inherit src coreutils;
    builder = builtins.toFile "builder.sh" ''
      $coreutils/bin/cp -a $src/tools/rosbash $out
    '';
    outputHashAlgo = "sha256";
    outputHashMode = "recursive";
    outputHash = "1ylbgdcx1d7lxhhqcp7g7nqmf7f0xvw2v6zdr3khphp4x49rn6j3";
  };
in 
{
  inherit rosbash;
}
