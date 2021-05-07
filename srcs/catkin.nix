{ pkgs, fetchFromGitHub }:
let
  pkgSrc = pkgs.callPackage ../helpers/pkg-src.nix {
    src = fetchFromGitHub {
      owner = "ros";
      repo = "catkin";
      rev = "e40320ec3396070e908859bb9f889a7b4e6285ce";
      sha256 = "qlXeDe7ECp/Bw+NmXS8FP+jc1Znc7SXhjabAzkZMUiI=";
    };
  };
in
{
  catkin = pkgSrc "qlXeDe7ECp/Bw+NmXS8FP+jc1Znc7SXhjabAzkZMUiI=" ".";
}
