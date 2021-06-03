final: prev: {
  catkin = prev.catkin.overrideAttrs (_: rec {
    postPatch = ''
      for f in $(grep -lr /usr/bin/env cmake/templates); do
        substituteInPlace $f --replace '/usr/bin/env' ${prev.coreutils}/bin/env
      done
      substituteInPlace cmake/test/gtest.cmake --replace '/usr/src/googletest' ${prev.gmock.src}
    ''; 
  });


}
