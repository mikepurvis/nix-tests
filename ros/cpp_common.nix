{ colcon, catkin, stdenv, boost, console-bridge, gmock, python3Packages, coreutils, srcs }:
stdenv.mkDerivation {
    name = "cpp_common";
    outputs = [ "out" "dev" ];
    src = srcs.cpp_common;

    propagatedBuildInputs = [
        boost
        catkin
        console-bridge
    ];

    nativeBuildInputs = [
        colcon
    ];

    phases = ["unpackPhase" "patchPhase" "buildPhase" "fixupPhase"];

    inherit colcon;
    inherit catkin;

    buildPhase = ''
      source $catkin/setup.sh
      mkdir -p $dev
      cd /build
      $colcon/bin/colcon \
        build \
        --paths source \
        --install-base $out
    '';
} 
