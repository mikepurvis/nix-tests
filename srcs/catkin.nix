{ fetchFromGitHub, stdenvNoCC, coreutils }:
let
  helpers = import ../helpers.nix;

  pkgSrc = helpers.pkgRepoSrc {
    inherit stdenvNoCC coreutils;
    src = fetchFromGitHub {
      owner = "ros";
      repo = "catkin";
      rev = "e40320ec3396070e908859bb9f889a7b4e6285ce";
      sha256 = "qlXeDe7ECp/Bw+NmXS8FP+jc1Znc7SXhjabAzkZMUiI=";
    };
  };
in
{
  catkin = pkgSrc {
    name = "catkin";
    path = ".";
    outputHash = "qlXeDe7ECp/Bw+NmXS8FP+jc1Znc7SXhjabAzkZMUiI=";
  };
}
