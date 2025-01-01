if status is-interactive
    # Commands to run in interactive sessions can go here
end

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export EDITOR=hx
zoxide init fish | source
starship init fish | source

alias k=kubectl
alias kgp='kubectl get po'
alias kgs='kubectl get sts'
alias kgd='kubectl get deploy'
alias kgc='kubectl get cm'

alias stk='starship toggle kubernetes'
alias nhs='nix run nixpkgs#home-manager -- switch --flake nix/#$USER'
switcher init fish | source

# eza
alias ld='eza -lh  --total-size'
alias y='yazi'

function s --wraps switcher
    kubeswitch $argv
end

function kxb
    kubectl exec -it $argv -- /bin/bash
end

function kxs
    kubectl exec -it $argv -- /bin/sh
end
