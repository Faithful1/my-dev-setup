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
