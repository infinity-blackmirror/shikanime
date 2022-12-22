{ pkgs, ... }:

{
  home.packages = [
    pkgs.sqlfluff
  ];

  programs.neovim.plugins = [
    (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
      sql
    ]))
  ];
}
