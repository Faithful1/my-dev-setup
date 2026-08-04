#!/usr/bin/env bash

alias tf="terraform"
alias tg="terragrunt"

# Kubernetes
alias k="kubectl"
alias kctx="kubectl config current-context"
alias kuse="kubectl config use-context"
alias kns="kubectl config set-context --current --namespace"

alias kgp="kubectl get pods"
alias kgpa="kubectl get pods -A"
alias kgs="kubectl get svc"
alias kgd="kubectl get deploy"
alias kgn="kubectl get nodes"
alias kgns="kubectl get ns"
alias kgcm="kubectl get configmap"
alias kgsec="kubectl get secret"

alias kd="kubectl describe"
alias kdp="kubectl describe pod"
alias kdelp="kubectl delete pod"

alias kaf="kubectl apply -f"
alias kdf="kubectl delete -f"
alias klogs="kubectl logs -f"
alias kexec="kubectl exec -it"

# Docker
alias d="docker"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias di="docker images"
alias dexec="docker exec -it"
alias dlogs="docker logs -f"
alias drm="docker rm"
alias drmi="docker rmi"
alias dstop="docker stop"
alias dstart="docker start"
alias drestart="docker restart"
alias dprune="docker system prune"
alias dc="docker compose"
alias dcup="docker compose up"
alias dcupd="docker compose up -d"
alias dcdown="docker compose down"
alias dcb="docker compose build"
alias dclogs="docker compose logs -f"
