{ pkgs, lib, ... }:

with lib;

{
  imports = [
    ../identities/sfeir.nix
    ../profiles/base.nix
    ../profiles/workstation.nix
    ../profiles/vcs.nix
    ../profiles/cc.nix
    ../profiles/ruby.nix
    ../profiles/beam.nix
    ../profiles/go.nix
    ../profiles/opam.nix
    ../profiles/rust.nix
    ../profiles/python.nix
    ../profiles/web.nix
    ../profiles/latex.nix
    ../profiles/sql.nix
    ../profiles/cloud.nix
    ../profiles/java.nix
    ../profiles/experimental/github-copilot-cli.nix
  ];

  home.homeDirectory = "/Users/williamphetsinorath";
  home.username = "williamphetsinorath";

  nix.package = pkgs.nix;

  programs.zsh.initExtra = mkAfter ''
    if command -v brew >/dev/null; then
      eval "$(brew shellenv)"
    fi
  '';
}
