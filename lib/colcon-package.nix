{ cmake, colcon, stdenv, srcs }:
{ name,
  src ? srcs.${name},
  ... }@args:
stdenv.mkDerivation ({
  inherit src;
  outputs = [ "out" "dev" ];

  # Needs to be conditional on package having architecture_independent.
  # separateDebugInfo = true;

  phases = ["unpackPhase" "patchPhase" "buildPhase" "preFixupPhase" "fixupPhase"];

  buildInputs = [ cmake ];
  nativeBuildInputs = [ cmake colcon ];

  inherit colcon;
  buildPhase = ''
    runHook preBuild
    $colcon/bin/colcon build \
      --build-base /build \
      --paths /build/source \
      --merge-install \
      --install-base $out
    runHook postBuild
  '';

  preFixupPhase = ''
    # Root directory colcon setup files that we don't want.
    rm -f $out/{setup.sh,.catkin,.colcon_install_layout,COLCON_IGNORE}

    # If it exists, move the cmake directory to dev, and if so
    # also symlink the package.xml there, if that exists.
    if [[ -e $out/share/$name/cmake ]]; then
      moveToOutput "share/$name/cmake" "$dev"
      package_xml=share/$name/package.xml
      if [[ -e $out/$package_xml ]]; then
        mkdir -p $(dirname $dev/$package_xml)
        ln -s $out/$package_xml $dev/$package_xml
      fi
    fi
  '';
} // args)
