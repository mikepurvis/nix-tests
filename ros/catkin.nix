{ cmake, colcon, stdenv, gmock, python3Packages, coreutils, srcs }:
stdenv.mkDerivation {
    name = "catkin";
    outputs = [ "out" "dev" ];
    src = srcs.catkin;
    # separateDebugInfo = true;

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
      $colcon/bin/colcon build \
        --build-base /build \
        --paths /build/source \
        --merge-install \
        --install-base $out
    '';

    preFixup = ''
      rm $out/{setup.sh,.catkin,.colcon_install_layout,COLCON_IGNORE}
      moveToOutput "share/$name/cmake" "$dev"
      mkdir -p $dev/share/$name
      ln -s $out/share/$name/package.xml $dev/share/$name/package.xml
    '';
}
