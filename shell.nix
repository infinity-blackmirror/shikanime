{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = [ pkgs.texlive.combined.scheme-full pkgs.gnumake pkgs.docker ];
}
