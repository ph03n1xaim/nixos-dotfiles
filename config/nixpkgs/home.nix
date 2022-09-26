{ config, pkgs, ...}: {
  home.username = "aravind";
  home.homeDirectory = "/home/aravind";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    neofetch
    cmatrix
    fd
    rename
    xorg.xsetroot
    htop
    scrot
    devour
    cmake
    unixtools.column
    gnumake
    libtool
    betterlockscreen
    cinnamon.nemo
    zathura
    brave
    firefox
    libreoffice
    slack
    gimp
    xournal
    openjdk
    gcc
    python3
    nodejs
    rPackages.npm
    rustup
    flutter
    android-studio
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = false;
    withPython3 = true;
    extraConfig = ''
        let g:coc_data_home = $HOME . '/.config/coc'
        set expandtab
        set tabstop=4
        set shiftwidth=4
      '';
    coc.enable = true;
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      nodePackages.yaml-language-server
      nodePackages.vscode-langservers-extracted

      rls
      jdt-language-server

      nodePackages.prettier
      nixpkgs-fmt
      rustfmt
      terraform
    ];
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-lastplace
      vim-markdown
      markdown-preview-nvim
      nvim-jdtls
      coc-java
      coc-nvim
      coc-css
      coc-explorer
      coc-git
      coc-go
      coc-html
      coc-json
      coc-prettier
      coc-pyright
      coc-rust-analyzer
      coc-yaml
      copilot-vim
      vim-surround
    ];
  };

  home.stateVersion = "22.05";

  home.sessionPath = [ "$HOME/.local/bin" ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "brave";
    TERMINAL = "kitty";
    TERM = "kitty";
  };
}

