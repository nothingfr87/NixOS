{ config, pkgs, ... }:

{

  home.username = "nothing";
  home.homeDirectory = "/home/nothing";
  home.stateVersion = "25.11";

  # User Level Packages
  home.packages = with pkgs; [
    # Code Editors
    neovim
    vscode

    # Tools & Formatters
    gnumake
    ripgrep
    nixfmt
    black
    prettier
    stylua

    # LSP & Code Stuff
    typescript-language-server
    pyright
    clang-tools
    lua-language-server
    vscode-langservers-extracted
    nixd

    # Language Interpreters & Compilers
    lua
    nodejs
    python3
    typescript
    gcc
    libgcc
    clang
    libclang
    gdb

    # Design & Writing & Interent
    gimp
    obsidian
    firefox
    libreoffice
    onlyoffice-desktopeditors

    # Desktop Utilities
    nemo
    celluloid
    pix
    feh
    mpv
    vlc
    vicinae
    rofi
    slurp
    grim
    sway-contrib.grimshot
    nwg-look
    yazi
    mako
    swayidle
    swaybg
    swaylock
    waybar

    # Terminal
    foot

    # Terminal Utilities
    fastfetch
    fzf
    bat
    btop
    cmatrix
    imagemagick

    # GTK
    papirus-icon-theme
    tokyonight-gtk-theme
    bibata-cursors
    adw-gtk3
    adwaita-icon-theme
  ];

  # Bash
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/NixOS/non-os#null-pc";
      nfu = "nix flake update";
      vcx = "vim ~/NixOS/non-os/configuration.nix";
      vhx = "vim ~/NixOS/non-os/home.nix";
      vfx = "vim ~/NixOS/non-os/flake.nix";
      install = "nix-shell -p";
      ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      ff = "fastfetch";
      vim = "nvim";
      cdnv = "cd ~/.config/nvim";
    };
    initExtra = ''
      export PS1='\[\e[38;5;82m\]\u\[\e[0m\] in \[\e[38;5;81m\]\w\[\e[0m\] \\$ '
    '';
  };

  # Fish
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    functions = {
      fish_prompt = {
        body = ''
          set_color green
          printf "%s" (whoami)

          set_color normal
          printf " in "

          set_color blue
          printf "%s" (prompt_pwd)

          set_color normal
          printf "%s \$ "
        '';
      };
    };
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/NixOS/non-os#null-pc";
      nfu = "nix flake update";
      vcx = "vim ~/NixOS/non-os/configuration.nix";
      vhx = "vim ~/NixOS/non-os/home.nix";
      vfx = "vim ~/NixOS/non-os/flake.nix";
      install = "nix-shell -p";
      ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      ff = "fastfetch";
      vim = "nvim";
      cdnv = "cd ~/.config/nvim";
    };
  };

  # Git
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Nothing";
        email = "173809041+nothingfr87@users.noreply.github.com";
      };
    };
  };

  # Bat
  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin Mocha";
    };
  };
}
