set fish_greeting

function fish_prompt
    set_color green
    printf "%s" (whoami)

    set_color normal
    printf " in "

    set_color blue
    printf "%s" (prompt_pwd)

    set_color normal
    printf "%s \$ "
end

alias nrs='sudo nixos-rebuild switch --flake .#null-pc'
alias ns="nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
alias vim='nvim'
