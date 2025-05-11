if status is-interactive
    # Commands to run in interactive sessions can go here

end


alias appLaunch='/home/micqdf/.config/rofi/launchers/type-1/launcher.sh'
alias hyperLoad='$HOME/.local/share/hyprload/hyprload.sh'
alias home='cd $HOME'
alias vfish='nvim $HOME/.config/fish/config.fish'
alias cdfish='cd $HOME/.config/fish/'
#alias lvim='/home/micqdf/.local/bin/lvim'
alias cl='clear'
alias kssh="kitten ssh"
alias golangci-lint="/home/micqdf/go/bin/golangci-lint"
#alias air="/home/micqdf/go/bin/air"
alias hcat="highlight"
alias ls="lsd -l"
alias ddevpull="~/.tools/ddevpull"
alias behat="set -l CURRENT_DIR (pwd); docker run --rm -v $CURRENT_DIR:/src docksal/behat --colors (string join ' ' $argv)"
alias upgrade 'cd ~/.nix-config; nix flake update; sudo nixos-rebuild switch --flake .#hypr-nix'

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set -gx PATH $PATH $HOME/go/bin

