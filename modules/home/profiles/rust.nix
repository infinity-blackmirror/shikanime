{ pkgs, ... }:

{
  programs.zsh.oh-my-zsh.plugins = [
    "rust"
  ];

  home.packages = [
    pkgs.rustup
  ];
}
