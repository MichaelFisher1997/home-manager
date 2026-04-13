{ pkgs, ... }:

let
  # Extra plugins not included in oh-my-zsh by default
  zshPlugins = [
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
  ];
in
{
  home.packages = zshPlugins;

  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "lsd -l";
      hcat = "highlight";
      upgrade = "cd /home/micqdf/nixos/nix-config; nix flake update; sudo nixos-rebuild switch --flake .#hypr-nix";
      home-upgrade = "home-manager switch --flake ~/nixos/home-manager/#micqdf";
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git" # Git prompt & aliases
        "z" # Directory jumping like Fish
        "colored-man-pages" # Colored man pages
        "command-not-found" # Auto-suggest installing missing programs
        "history" # History enhancements
        "sudo" # Easy !! sudo prefixing
      ];
    };

    initContent = ''
      # Enable autosuggestions and syntax highlighting
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

      # Fish-style autosuggestions color
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    '';
  };
}

