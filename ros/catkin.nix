{ src, colcon, stdenv, gmock, python3Packages, coreutils }:
stdenv.mkDerivation {
    name = "catkin";
    #outputs = [ "out" "dev" ];
    inherit src;

    x = ''
    checkInputs = [
        python3Packages.mock
        python3Packages.nose
    ];
    propagatedBuildInputs = [
        gmock
        python3Packages.catkin-pkg
        python3Packages.empy
        python3Packages.nose
        python3Packages.setuptools
    ];
    nativeBuildInputs = [
        colcon
    ];
    '';

    phases = ["unpackPhase" "patchPhase" "buildPhase" "fixupPhase"];
    postPatch = ''
      for f in $(grep -lr /usr/bin/env cmake/templates); do
        substituteInPlace $f --replace '/usr/bin/env' ${coreutils}/bin/env
      done
    '';

    inherit colcon;
    buildPhase = ''
      cd /build
      $colcon/bin/colcon \
        build \
        --paths catkin-src \
        --install-base $out
    '';
    #--cmake-args -DCATKIN_GLOBAL_INCLUDE_DESTINATION=$dev/include
}
