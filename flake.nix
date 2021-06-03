{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:mikepurvis/nixpkgs";
    nix-ros-overlay.url = "github:mikepurvis/nix-ros-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nix-ros-overlay, flake-utils }:
    with flake-utils.lib;
    eachSystem allSystems (system:
      let pkgs = import nixpkgs {
        inherit system;
        overlays = [
          nix-ros-overlay.overlay
          (import ./srcs)
        ];
      };
    in {
      #packages = pkgs.rosPackages // pkgs;
      packages = pkgs;
      #// {
      #  inherit srcs;
      #  ros = pkgs.callPackages ./ros { inherit srcs; };
      #  colcon = pkgs.colcon;
      #};
      #overlay = import ./overlay.nix;

      devShell = import ./ros-base.nix {
        inherit pkgs;
        rosPackages = pkgs.rosPackages;
      };
    }) // {
      nixosModule = import ./modules;
    };
}
