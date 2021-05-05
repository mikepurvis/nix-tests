{ fetchFromGitHub, stdenv, coreutils }:

let
  gitrev = "a8851ec7f44d2d20498f74b090b05841e930613e";
in 
  stdenv.mkDerivation {
    pname = "ros-rsource";
    version = "${gitrev}";
    outputs = [
      "ros_source"
      "rosbash_source"
      "rosunit_source"
      ];
    src = fetchFromGitHub {
          owner = "ros";
          repo = "ros";
          rev = "${gitrev}";
          sha256 = "2s5ygezK2vPfjIXqk4PGoXsIVuv42dac8nW47rxwOPs=";
        };
    builder = ./copy.sh;
    inherit coreutils;
  }
