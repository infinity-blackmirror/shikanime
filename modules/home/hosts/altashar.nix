{ pkgs, lib, ... }:

with lib;

let
  initExtra = mkAfter ''
    if command -v brew >/dev/null; then
      eval "$(brew shellenv)"
    fi
  '';
in
{
  imports = [
    ../identities/sfeir.nix
    ../identities/paprec.nix
    ../identities/galec.nix
    ../identities/tagheuer.nix
    ../identities/totalenergies.nix
    ../identities/webedia.nix
    ../profiles/base.nix
    ../profiles/editor.nix
    ../profiles/workstation.nix
    ../profiles/vcs.nix
    ../profiles/cloud.nix
    ../profiles/javascript.nix
    ../profiles/python.nix
    ../profiles/rust.nix
    ../profiles/beam.nix
    ../profiles/go.nix
  ];

  home.homeDirectory = "/Users/williamphetsinorath";
  home.username = "williamphetsinorath";

  nix.package = pkgs.nix;

  programs.zsh = { inherit initExtra; };
  programs.bash = { inherit initExtra; };
}
