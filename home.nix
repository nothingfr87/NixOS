{ config, pkgs, ... }:

{
  home.username = "nothing";
  home.homeDirectory = "/home/nothing";
  home.stateVersion = "25.11";
  
  # Bash
  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      nrs = "sudo nixos-rebuild switch --flake .#null-pc";
    };
    initExtra = ''
      export PS1='\[\e[38;5;82m\]\u\[\e[0m\] in \[\e[38;5;81m\]\w\[\e[0m\] \\$ '
    '';
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

  # Alacritty
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          y = 10;
          x = 10;
        };
      };
      font = {
        normal.family = "JetBrainsMono NF";
        bold.family = "JetBrainsMono NF";
        italic.family = "JetBrainsMono NF";
      };
      colors = {
        bright = {
          black = "#444b6a";
          blue = "#7da6ff";
          cyan = "#0db9d7";
          green = "#b9f27c";
          magenta = "#bb9af7";
          red = "#ff7a93";
          white = "#acb0d0";
          yellow = "#ff9e64";
        };
        normal = {
          black = "#32344a";
          blue = "#7aa2f7";
          cyan = "#449dab";
          green = "#9ece6a";
          magenta = "#ad8ee6";
          red = "#f7768e";
          white = "#787c99";
          yellow = "#e0af68";
        };
        primary = {
          background = "#1a1b26";
          foreground = "#a9b1d6";
        };
      };
    };
  };
}
