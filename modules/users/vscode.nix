{ pkgs, ... }:

{
  services.syncthing = {
    user = "vscode";
    group = "users";
    dataDir = "/home/vscode";
    folders = {
      Default = {
        enable = true;
        id = "default";
        path = "/home/vscode/Sync";
        devices = [
          "Altashar"
          "Ishtar"
          "Olva"
          "Elkia"
          "ElvenGard"
        ];
      };
      Source = {
        enable = true;
        id = "source";
        path = "/home/vscode/Source";
        devices = [
          "Altashar"
          "Ishtar"
          "Olva"
          "Elkia"
          "ElvenGard"
        ];
      };
      Sfeir = {
        enable = true;
        id = "Sfeir";
        path = "/home/vscode/Sfeir";
        devices = [
          "Altashar"
          "Ishtar"
          "Olva"
          "Elkia"
          "ElvenGard"
        ];
      };
    };
  };

  # Create user accounts
  users.users.vscode = {
    isNormalUser = true;
    home = "/home/vscode";
    extraGroups = [ "docker" "wheel" "syncthing" ];
    shell = pkgs.zsh;
    initialHashedPassword = "";
    openssh.authorizedKeys.keyFiles = [
      (builtins.fetchurl {
        url = "https://github.com/shikanime.keys";
        sha256 = "sha256:0gz0n7rbxlxjn7h6gn6ag1i3d66ziqj39943cka52m827c2q9a5k";
      })
    ];
  };

  # Configure user home
  home-manager.users.vscode = {
    imports = [
      ../home/users/sfeir.nix
      ../home/profiles/base.nix
      ../home/profiles/workstation.nix
      ../home/profiles/xdg.nix
      ../home/profiles/vcs.nix
      ../home/profiles/cc.nix
      ../home/profiles/ruby.nix
      ../home/profiles/beam.nix
      ../home/profiles/go.nix
      ../home/profiles/opam.nix
      ../home/profiles/rust.nix
      ../home/profiles/python.nix
      ../home/profiles/web.nix
      ../home/profiles/latex.nix
      ../home/profiles/sql.nix
      ../home/profiles/cloud.nix
      ../home/profiles/java.nix
    ];
  };
}
