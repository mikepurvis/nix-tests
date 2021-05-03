{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:lopsided98/nixpkgs/nix-ros";
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nix-ros-overlay, flake-utils }:
    with flake-utils.lib;
    eachSystem allSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nix-ros-overlay.overlay ];
      };
    in {
      packages = pkgs.rosPackages;
      devShell = import ./ros-base.nix { inherit pkgs; rosPackages = pkgs.rosPackages;};
    }) // {
      # overlay = import ./overlay.nix;
      nixosModule = import ./modules;
    };
}
