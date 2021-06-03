{ pkg-src, fetchFromGitHub }:
let
  pkg = pkg-src (fetchFromGitHub {
    owner = "ros";
    repo = "roscpp_core";
    rev = "b35b3fc483d47ec4ef8b07930378ee93f3663c0c";
    sha256 = "8/ZR1Khy/0hXZOAR/3Wg5WfAB2M9PovdNIG5YmnTho0=";
  });
in
{
  cpp_common = pkg "OWcqGpx0HJoRP+PSZ9VVnXKFgqLK1h8kxlMWaF14c4A=" "cpp_common";
}
