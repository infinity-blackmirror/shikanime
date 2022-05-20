{ pkgs ? import <nixpkgs> { }, ... }:

{
  # Enable experimental features so we can access flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Allow unfree software such as Cloudflared or CUDA
  nixpkgs.config.allowUnfree = true;

  # Increase the inotify limit for Syncthing
  boot.kernel.sysctl."fs.inotify.max_user_watches" = "204800";

  # Virtualization settings
  virtualisation = {
    docker.enable = true;
    containerd.enable = true;
  };

  # Manage fonts
  fonts = {
    fontDir.enable = true;
    fonts = [ pkgs.fira-code ];
  };

  # Enforce requirement of X11 libraries
  environment.noXlibs = false;

  # List packages installed in system profile.
  environment.systemPackages = [
    pkgs.bashInteractive
    pkgs.cacert
    pkgs.nix
    pkgs.killall
    pkgs.git
    pkgs.xclip
    pkgs.inotify-tools
    pkgs.e2fsprogs
  ];

  # Enable modern IPv6 support
  networking.enableIPv6 = true;

  # Enable well known secure DNS servers
  networking.networkmanager.insertNameservers = [
    "1.1.1.2"
    "1.0.0.2"
    "1.1.1.1"
    "1.0.0.1"
    "8.8.8.8"
    "8.8.4.4"
  ];

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable Network Time Protocol
  services.ntp.enable = true;

  # Keep the system timezone up-to-date based on the current location
  services.localtime.enable = true;

  # Compatibility for alien binary with hardcoded ld paths
  system.activationScripts.ldlinux = ''
    mkdir -m 0755 -p /lib64
    ln -sfn ${pkgs.stdenv.glibc.out}/lib64/ld-linux-x86-64.so.2 /lib64/.ld-linux-x86-64.so.2.tmp
    mv -f /lib64/.ld-linux-x86-64.so.2.tmp /lib64/ld-linux-x86-64.so.2
  '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html)
  system.stateVersion = "21.11";
}
