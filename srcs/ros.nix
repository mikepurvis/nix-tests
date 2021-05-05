{ fetchFromGitHub, stdenvNoCC, coreutils }:
let
  helpers = import ../helpers.nix { 
    inherit fetchFromGitHub stdenvNoCC coreutils;
  };

  # Repo details.
  pkgSrc = helpers.pkgRepoSrc {
    src = fetchFromGitHub {
      owner = "ros";
      repo = "ros";
      rev = "a8851ec7f44d2d20498f74b090b05841e930613e";
      sha256 = "2s5ygezK2vPfjIXqk4PGoXsIVuv42dac8nW47rxwOPs=";
    };
  };
in 
{
  # One entry per package within the repo.
  rosbash = pkgSrc {
    name = "rosbash";
    path = "tools/rosbash";
    outputHash = "2s5ygezK2vPfjIXqk4PGoXsIVuv42dac8nW47rxwOPs=";
  };
  rosunit = pkgSrc {
    name = "rosunit";
    path = "tools/rosunit";
    outputHash = "2s5ygezK2vPfjIXqk4PGoXsIVuv42dac8nW47rxwOPs=";
  };
}
