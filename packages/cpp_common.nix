{ colconPackage, catkin, boost, console-bridge, colcon, srcs }:
colconPackage {
  name = "cpp_common";
  separateDebugInfo = true;

  propagatedBuildInputs = [
    boost
    catkin
    console-bridge
  ];

  inherit colcon;
  inherit catkin;

  buildPhase = ''
    source $catkin/local_setup.sh  # needs to be a hook
    $colcon/bin/colcon build \
      --build-base /build \
      --paths /build/source \
      --merge-install \
      --install-base $out \
      --cmake-args $cmakeFlags
  '';
} 
