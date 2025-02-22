{ pkgs, ... }:

{
  programs.neovim.withPython3 = true;

  programs.zsh.oh-my-zsh.plugins = [
    "python"
    "poetry"
  ];

  home.packages = [
    pkgs.python3Minimal
    pkgs.poetry
    pkgs.pdm
  ];
}
