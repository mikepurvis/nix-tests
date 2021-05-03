# with import ./. {};
{ pkgs,
  rosPackages
}:
with rosPackages.noetic;
with pythonPackages;

pkgs.mkShell {
  buildInputs = [
    pkgs.glibcLocales
    pkgs.nix
    (buildEnv { paths = [
      ros-base
    ]; })
  ];

  ROS_HOSTNAME = "localhost";
  ROS_MASTER_URI = "http://localhost:11311";
}
