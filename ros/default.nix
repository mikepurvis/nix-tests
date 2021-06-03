final: prev: {
  catkin = prev.callPackage ./catkin.nix {};
  cpp_common = prev.callPackage ./cpp_common.nix {};
}


#  let
#    catkin = pkgs.callPackage ./catkin.nix { src = srcs.catkin; };
#    cpp_common = pkgs.callPackage ./cpp_common.nix { src = srcs.cpp_common; };
#  in
#  {
#    catkin = catkin.overrideAttrs (_: rec {
#      postPatch = ''
#        for f in $(grep -lr /usr/bin/env cmake/templates); do
#          substituteInPlace $f --replace '/usr/bin/env' ${pkgs.coreutils}/bin/env
#        done
#        substituteInPlace cmake/test/gtest.cmake --replace '/usr/src/googletest' ${pkgs.gmock.src}
#      ''; 
#    });
#    inherit cpp_common;
#  }
