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
      nrs = "sudo nixos-rebuild switch";
    };
    initExtra = ''
      export PS1='\[\e[38;5;82m\]\u\[\e[0m\] in \[\e[38;5;81m\]\w\[\e[0m\] \\$ '
    '';
  };

  # GIT
    programs.git = {
    enable = true;
    userName = "Nothing";
    userEmail = "173809041+nothingfr87@users.noreply.github.com";
  };
}
