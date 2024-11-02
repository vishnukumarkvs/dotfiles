if status is-interactive
    # Commands to run in interactive sessions can go here
end

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

zoxide init fish | source
starship init fish | source

alias k=kubectl
alias kp='kubectl get po'
alias ks='kubectl get sts'
alias kd='kubectl get deploy'
alias kcm='kubectl get cm'

alias stk='starship toggle kubernetes'
alias nhs='nix run nixpkgs#home-manager -- switch --flake nix/#$USER'
switcher init fish | source

# eza
alias ld='eza -lh  --total-size'

function s --wraps switcher
    kubeswitch $argv
end

function kxb
    kubectl exec -it $argv -- /bin/bash
end

function kxs
    kubectl exec -it $argv -- /bin/sh
end
