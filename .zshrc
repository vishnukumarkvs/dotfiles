export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

alias y='yazi'

alias k='kubectl'

alias gp="git pull"
alias gcm="git checkout main"

alias s='kubectx'
alias sns='kubens'

alias stk="starship toggle kubernetes"
