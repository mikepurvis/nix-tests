{ fetchFromGitHub, stdenvNoCC, coreutils }:
let
  helpers = import ../helpers.nix;

  # Repo details.
  pkgSrc = helpers.pkgRepoSrc {
    inherit stdenvNoCC coreutils;
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
    outputHash = "QxqbE+nkwgvnyO2bLfjuwB1XsT3vXIYh7PS00Fl7i/o=";
  };
  rosunit = pkgSrc {
    name = "rosunit";
    path = "tools/rosunit";
    outputHash = "r7CLon8ziqI/WQ9MuCeo0vp7JBzWPzAtcS+HhT5tKUk=";
  };
}
