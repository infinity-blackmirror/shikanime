{ modulesPath, ... }:

{
  imports = [
    "${toString modulesPath}/virtualisation/virtualbox-image.nix"
  ];
}
