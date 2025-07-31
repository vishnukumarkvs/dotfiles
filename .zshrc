export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

alias c='hx ~/.zshrc'

alias y='yazi'
alias ls='eza'
alias t='touch'

alias k='kubectl'

alias gp="git pull"
alias gcm="git checkout main"

alias s='kubectx'
alias sns='kubens'

alias stk="starship toggle kubernetes"



# Get frequently used resources
alias kga='kubectl get all'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kgns='kubectl get namespaces'

# Describe resources
alias kdp='kubectl describe pod'
alias kds='kubectl describe svc'
alias kdd='kubectl describe deployment'

# Logs
alias kl='kubectl logs'
alias klf='kubectl logs -f'

# Exec into pod
alias ke='kubectl exec -it'

# Apply and delete
alias ka='kubectl apply -f'
alias kd='kubectl delete -f'

# Namespace shortcuts
alias kcn='kubectl config set-context --current --namespace'
alias kn='kubectl config view --minify | grep namespace'

# Context and cluster
alias kc='kubectl config current-context'
alias kcc='kubectl config use-context'
alias kctx='kubectl config get-contexts'

# Edit resources
alias ked='kubectl edit deployment'
alias kep='kubectl edit pod'

# Port forwarding
alias kpf='kubectl port-forward'

# Watch resources
alias kgpw='watch kubectl get pods'
alias kgsw='watch kubectl get svc'

# Delete pod by name quickly
alias krm='kubectl delete pod'

# Custom get all (without events)
alias kall='kubectl get pods,svc,deployments,statefulsets,configmaps,secrets'

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/kvsvishnukumar/.lmstudio/bin"
# End of LM Studio CLI section

# SOPS
export SOPS_AGE_KEY_FILE=$HOME/.config/sops/age/keys.txt

export PATH=$PATH:$(go env GOPATH)/bin
eval "$(atuin init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
