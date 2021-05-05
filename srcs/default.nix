{ pkgs }:
# One row per repo, package sources within pulled to a common namespace.
pkgs.callPackages ./ros.nix { } //
pkgs.callPackages ./ros.nix { } //
pkgs.callPackages ./ros.nix { } //
{}
