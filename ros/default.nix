final: prev: {
  catkin = prev.callPackage ./catkin.nix {};
  cpp_common = prev.callPackage ./cpp_common.nix {};
}
