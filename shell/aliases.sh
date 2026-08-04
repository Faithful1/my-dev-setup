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
alias kg="kubectl get"
alias kga="kubectl get all -A"
alias ktop="kubectl top pods -A"
alias klogsn="kubectl logs -f -n"

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

# Git
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gl="git pull"
alias gp="git push"

# Helm
alias h="helm"
alias hl="helm list -A"
alias hi="helm install"
alias hu="helm upgrade"
alias hun="helm uninstall"

# Terraform / Terragrunt workflows
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tgi="terragrunt init"
alias tgp="terragrunt plan"
alias tga="terragrunt apply"

# Extra Docker shortcuts
alias dcu="docker compose up -d --build"
alias dpsq="docker ps -q"
alias dclean="docker system prune -f"

# General shell
alias ll="ls -lah"
alias la="ls -A"
alias ..="cd .."
alias ...="cd ../.."
alias c="clear"
alias j="jq"
alias y="yq"
