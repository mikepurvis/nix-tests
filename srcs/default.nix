{ pkgs }:
{
  ros = pkgs.callPackages ./ros.nix { };
}
