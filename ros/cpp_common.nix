{ colcon, catkin, stdenv, gmock, python3Packages, coreutils, src }:
stdenv.mkDerivation {
    name = "cpp_common";
    outputs = [ "out" "dev" ];
    inherit src;

    propagatedBuildInputs = [
        catkin
        colcon
        gmock
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
