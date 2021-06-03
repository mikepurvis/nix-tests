{ cmake, colcon, catkin, stdenv, boost, console-bridge, gmock, python3Packages, coreutils, srcs }:
stdenv.mkDerivation {
    name = "cpp_common";
    outputs = [ "out" "dev" ];
    src = srcs.cpp_common;
    separateDebugInfo = true;

    propagatedBuildInputs = [
        boost
        catkin
        console-bridge
    ];

    buildInputs = [ cmake ];

    nativeBuildInputs = [ colcon ];

    phases = ["unpackPhase" "patchPhase" "buildPhase" "fixupPhase"];

    inherit colcon;
    inherit catkin;

    cmakeFlags = [ "-DCATKIN_GLOBAL_INCLUDE_DESTINATION=$dev/include" ];

    buildPhase = ''
      source $catkin/local_setup.sh
      $colcon/bin/colcon build \
        --build-base /build \
        --paths /build/source \
        --merge-install \
        --install-base $out
    '';

    preFixup = ''
      rm $out/{setup.sh,.catkin,.colcon_install_layout,COLCON_IGNORE}
      moveToOutput "share/*/cmake" "$dev"
    '';
} 
