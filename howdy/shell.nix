{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.python312Packages.pip
    pkgs.python312Packages.setuptools
    pkgs.python312Packages.wheel
    pkgs.meson
    pkgs.ninja
    pkgs.pkg-config
    pkgs.libevdev
    pkgs.libinih
    pkgs.opencv4
  ];

  shellHook = ''
    export PYTHONPATH="${pkgs.python3.sitePackages}"
  '';
}
