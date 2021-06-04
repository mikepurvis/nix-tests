{ colconPackage, gmock, python3Packages }:
colconPackage {
  name = "catkin";

  propagatedBuildInputs = [
    gmock
    python3Packages.catkin-pkg
    python3Packages.empy
    python3Packages.nose
    python3Packages.setuptools
  ];
}
