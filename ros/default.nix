{ pkgs, srcs }:
{
  catkin = pkgs.callPackage ./catkin.nix { src = srcs.catkin; };
}
