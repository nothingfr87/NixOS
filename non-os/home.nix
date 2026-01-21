{ config, pkgs, ... }:

{
  home.username = "nothing";
  home.homeDirectory = "/home/nothing";
  home.stateVersion = "25.11";

  # User Level Packages
  home.packages = with pkgs; [
    ripgrep
    typescript-language-server
    pyright
    clang-tools
    lua-language-server
    vscode-langservers-extracted
    nil
    nixpkgs-fmt
    nixfmt
    black
    prettier
    stylua
    lua
    nodejs
    python3
    typescript
    gcc
    libgcc
    gdb
    gimp
    obsidian
    fastfetch
    picom
    neovim
    fzf
    bat
    btop
    pywal16
    imagemagick
    nwg-look
    pywalfox-native
    foot
    rofi
    swaylock
    waybar
    grim
    slurp
    sway-contrib.grimshot
  ];

  # Vesktop
  programs.vesktop.enable = true;

  # Firefox
  programs.firefox = {
    enable = true;
  };

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

  # Foot
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono NF:size=12";
        pad = "10x10";
        #include = "~/.cache/wal/colors-foot.ini"; # uncomment if you want to use pywal
      };
      colors = {
        foreground = "c0caf5";
        background = "1a1b26";
        regular0 = "1a1b26";
        regular1 = "f7768e";
        regular2 = "9ece6a";
        regular3 = "e0af68";
        regular4 = "7aa2f7";
        regular5 = "bb9af7";
        regular6 = "7dcfff";
        regular7 = "cfc9c2";
        bright0 = "414868";
        bright1 = "f7768e";
        bright2 = "9ece6a";
        bright3 = "e0af68";
        bright4 = "7aa2f7";
        bright5 = "bb9af7";
        bright6 = "7dcfff";
        bright7 = "c0caf5";
        dim0 = "565f89";
        dim1 = "414868";
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

  # GTK
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
}
