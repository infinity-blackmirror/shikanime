{ pkgs ? import <nixpkgs> { }, ... }:

{
  # Enable XDG base directories
  xdg.enable = true;

  # Session configuration
  home.sessionVariables.EDITOR = "${pkgs.vim}/bin/vim";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  programs.vim.enable = true;

  programs.jq.enable = true;

  programs.dircolors.enable = true;

  programs.bash.enable = true;

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "vim-interaction"
      ];
    };
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "coopelec.ssh.dev.azure.com" = {
        hostname = "ssh.dev.azure.com";
        identityFile = "~/.ssh/coopelec_rsa";
      };
      "lvmh.ssh.dev.azure.com" = {
        hostname = "ssh.dev.azure.com";
        identityFile = "~/.ssh/lvmh_ed25519";
      };
      "gcmd.birdz.com" = {
        hostname = "gcmd.birdz.com";
        identityFile = "~/.ssh/birdz_ed25519";
      };
      "sfeir.gitlab.com" = {
        hostname = "gitlab.com";
        identityFile = "~/.ssh/sfeir_ed25519";
      };
      "elkia.local" = {
        hostname = "elkia.local";
        identityFile = "~/.ssh/elkia";
        user = "devas";
        forwardX11 = true;
        forwardAgent = true;
      };
      "elvengard.local" = {
        hostname = "elvengard.local";
        identityFile = "~/.ssh/elvengard";
        user = "devas";
        forwardX11 = true;
        forwardAgent = true;
      };
    };
    extraConfig = ''
      IdentitiesOnly yes
      HostKeyAlgorithms +ssh-rsa
      PubkeyAcceptedKeyTypes +ssh-rsa
    '';
  };

  programs.mercurial = {
    enable = true;
    userName = "Shikanime Deva";
    userEmail = "shikanime.deva@shikanime.studio";
  };

  programs.git = {
    enable = true;
    userName = "Shikanime Deva";
    userEmail = "shikanime.deva@shikanime.studio";

    aliases = {
      adog = "log --all --decorate --oneline --graph";
      pouf = "push --force-with-lease";
    };

    ignores = [
      "*~"
      ".fuse_hidden*"
      ".directory"
      ".Trash-*"
      ".nfs*"
    ];

    lfs.enable = true;

    signing = {
      key = "B9443725856FF9EB";
      signByDefault = true;
    };

    extraConfig = {
      core.editor = "${pkgs.vim}/bin/vim";
      pull.rebase = true;
      rebase.autostash = true;
      init.defaultBranch = "main";
      credential."https://dev.azure.com".useHttpPath = true;
      credential."https://source.developers.google.com".helper = "${pkgs.google-cloud-sdk}/bin/git-credential-gcloud.sh";
    };
  };

  home.stateVersion = "22.05";
}
