{ pkgs ? import <nixpkgs> { }, ... }:

{
  # Configure Home Manager to use NixOS global packages
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  # Deploy a nice default user friendly shell prompt
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "sudo"
      ];
    };
  };

  # Allow cgroup memory resize
  boot.kernelParams = [ "cgroup_enable=memory" "swapaccount=1" ];

  # Enable experimental features so we can access flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Add personal caching server
  nix.settings.substituters = [
    "https://shikanime.cachix.org"
  ];

  # Allow unfree software such as Cloudflared or CUDA
  nixpkgs.config.allowUnfree = true;

  # Manage fonts
  fonts = {
    fontDir.enable = true;
    fonts = [ pkgs.fira-code ];
  };

  # Add ~/.local/bin/ to $PATH
  environment.localBinInPath = true;

  # Enable modern IPv6 support
  networking.enableIPv6 = true;

  # Enable well known secure DNS servers
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
    "2606:4700:4700::1111"
    "2606:4700:4700::1001"
    "8.8.8.8"
    "8.8.4.4"
    "2001:4860:4860::8888"
    "2001:4860:4860::8844"
  ];

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  # Keep the system timezone up-to-date based on the current location
  services.localtime.enable = true;
}
