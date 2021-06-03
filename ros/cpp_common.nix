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

    phases = ["unpackPhase" "patchPhase" "preBuildPhase" "buildPhase" "fixupPhase"];

    inherit colcon;
    inherit catkin;

    cmakeFlags = [ "-DCATKIN_GLOBAL_INCLUDE_DESTINATION=$dev/include" ];

    preBuildPhase = ''
      export BOOST_THREAD_LIB="boost_thread"
      export BOOST_SYSTEM_LIB="boost_system"
      source $catkin/local_setup.sh
    '';

    buildPhase = ''
      echo "CPP: $CMAKE_PREFIX_PATH"
      echo "PP: $PYTHONPATH"
      mkdir -p $dev
      cd /build
      $colcon/bin/colcon \
        build \
        --paths source \
        --merge-install \
        --install-base $out
      rm $out/{setup.sh,.catkin,.colcon_install_layout,COLCON_IGNORE}
      moveToOutput "share/*/cmake" "$dev"
    '';
} 
