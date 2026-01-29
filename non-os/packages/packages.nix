{
  config,
  pkgs,
  inputs,
  ...
}:

{

  # System Level Packages
  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  # Font Packages
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    font-awesome
    monocraft
  ];

  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
    };
  };

  # User Level Packages
  home.packages = with pkgs; [
    # Code Editors
    neovim
    #   vscode

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
    #    clang
    #    libclang
    gdb

    # Design & Writing & Interent
    gimp
    obsidian
    firefox
    #    libreoffice
    #    onlyoffice-desktopeditors

    # Desktop Utilities
    nemo
    #    celluloid
    #    pix
    #    feh
    #    mpv
    #    vlc
    #    vicinae
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
    imagemagick

    # GTK
    papirus-icon-theme
    tokyonight-gtk-theme
    bibata-cursors
    adw-gtk3
    adwaita-icon-theme
  ];
}
