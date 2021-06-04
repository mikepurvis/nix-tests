final: prev: {
  colconPackage = prev.callPackage ../lib/colcon-package.nix {};

  catkin = prev.callPackage ./catkin.nix {};
  cpp_common = prev.callPackage ./cpp_common.nix {};
}
