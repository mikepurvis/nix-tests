final: prev: {
  srcs =
    # One row per repo, package sources within pulled to a common namespace.
    prev.callPackages ./ros.nix {} //
    prev.callPackages ./roscpp_core.nix {} //
    prev.callPackages ./catkin.nix {} //
    {};
}
