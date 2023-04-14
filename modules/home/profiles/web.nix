{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.nodejs
    pkgs.yarn
  ];

  home.sessionVariables = {
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/config";
    NPM_CONFIG_PREFIX = "${config.xdg.dataHome}/npm/lib/node_modules";
  };

  programs.zsh.oh-my-zsh.plugins = [
    "deno"
    "node"
    "npm"
    "yarn"
  ];

  programs.neovim = {
    withNodeJs = true;
    plugins = [
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
        javascript
        typescript
        css
        scss
        vue
        html
        graphql
        prisma
      ]))
    ];
  };
}
