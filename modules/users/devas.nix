{ pkgs, ... }:

{
  # TODO: I'm exclusively stealing the Syncthing service
  services.syncthing = {
    user = "devas";
    group = "users";
    dataDir = "/home/devas";
    folders = {
      "Default" = {
        enable = true;
        id = "default";
        path = "/home/devas/Sync";
        devices = [
          "Altashar"
          "Ishtar"
          "Olva"
          "Elkia"
          "Elven Gard"
        ];
      };
      "Source" = {
        enable = true;
        id = "source";
        path = "/home/devas/Source";
        devices = [
          "Altashar"
          "Ishtar"
          "Olva"
          "Elkia"
          "Elven Gard"
        ];
      };
      "Sfeir" = {
        enable = true;
        id = "Sfeir";
        path = "/home/devas/Sfeir";
        devices = [
          "Altashar"
          "Ishtar"
          "Olva"
          "Elkia"
          "Elven Gard"
        ];
      };
    };
  };

  # Create user accounts
  users.users.devas = {
    isNormalUser = true;
    home = "/home/devas";
    extraGroups = [
      "docker"
      "wheel"
      "syncthing"
    ];
    shell = pkgs.zsh;
    hashedPassword = "$6$YS5jCyZU2Z6i05wm$jFsx9fnINawEk2Vd5uZBdR71sOBHHgANUEBsp93fG3scp2uui3kYhzXh9c4eC4ZdHKq48//IWE00JwZ.ez.lg.";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF7pi5OYqzuMkTymIbJUJteIU3dz+OgduiF5O9cA+B7u devas@ishtar"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFChPMDHee+8F8tuchk8nLqdzVj1SOfLFv70NH95K6Yf williamphetsinorath@altashar"
    ];
    packages = [
      pkgs.inotify-tools
    ];
  };

  # Configure user home
  home-manager.users.devas = {
    imports = [
      ../homes/base.nix
      ../homes/version-control.nix
      ../homes/cpp.nix
      ../homes/development.nix
      ../homes/android.nix
      ../homes/ruby.nix
      ../homes/bazel.nix
      ../homes/beam.nix
      ../homes/go.nix
      ../homes/opam.nix
      ../homes/rustup.nix
      ../homes/python.nix
      ../homes/javascript.nix
      ../homes/php.nix
      ../homes/coursier.nix
      ../homes/google.nix
      ../homes/azure.nix
      ../homes/terraform.nix
      ../homes/sql.nix
      ../homes/aws.nix
      ../homes/kubernetes.nix
      ../homes/shikanime.nix
      ../homes/sfeir.nix
      ../homes/java.nix
      ../homes/dotnet.nix
      ../homes/xdg.nix
    ];
  };
}
