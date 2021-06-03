{ pkg-src, fetchFromGitHub }:
let
  pkg = pkg-src (fetchFromGitHub {
    owner = "ros";
    repo = "catkin";
    rev = "e40320ec3396070e908859bb9f889a7b4e6285ce";
    sha256 = "qlXeDe7ECp/Bw+NmXS8FP+jc1Znc7SXhjabAzkZMUiI=";
  });
in
{
  catkin = pkg "qlXeDe7ECp/Bw+NmXS8FP+jc1Znc7SXhjabAzkZMUiI=" ".";
}
