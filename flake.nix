{
  description = "A very basic flake";

  inputs = {
    # nixpkgs.url = "github:mikepurvis/nixpkgs";
    # nixpkgs.url = "github:NixOS/nixpkgs";
    nixpkgs.url = "github:lopsided98/nixpkgs/nix-ros";
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay";
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
          (import ./ros)
          (import ./overrides.nix)
        ];
      };
    in {
      packages = pkgs;

      devShell = import ./ros-base.nix {
        inherit pkgs;
        rosPackages = pkgs.rosPackages;
      };
    }) // {
      nixosModule = import ./modules;
    };
}
