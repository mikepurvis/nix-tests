{ fetchFromGitHub, stdenvNoCC, coreutils }:

let
  rev = "a8851ec7f44d2d20498f74b090b05841e930613e";
in 
  stdenvNoCC.mkDerivation {
    name = "ros-${rev}";

    outputs = [
      "ros"
      "rosbash"
      "rosunit"
    ];

    src = fetchFromGitHub {
      owner = "ros";
      repo = "ros";
      inherit rev;
      sha256 = "2s5ygezK2vPfjIXqk4PGoXsIVuv42dac8nW47rxwOPs=";
    };

    inherit coreutils;
    builder = builtins.toFile "builder.sh" ''
      $coreutils/bin/cp -a $src/ros $ros
      $coreutils/bin/cp -a $src/tools/rosbash $rosbash
      $coreutils/bin/cp -a $src/tools/rosunit $rosunit
    '';
  }
