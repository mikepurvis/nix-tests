{ cmake, colcon, stdenv, gmock, python3Packages, coreutils, srcs }:
stdenv.mkDerivation {
    name = "catkin";
    outputs = [ "out" "dev" ];
    src = srcs.catkin;

    propagatedBuildInputs = [
        colcon
        gmock
        python3Packages.catkin-pkg
        python3Packages.empy
        python3Packages.nose
        python3Packages.setuptools
    ];

    phases = ["unpackPhase" "patchPhase" "buildPhase" "fixupPhase"];

    inherit colcon;
    buildPhase = ''
      mkdir -p $dev
      cd /build
      $colcon/bin/colcon \
        build \
        --paths source \
        --install-base $out
    '';
}
