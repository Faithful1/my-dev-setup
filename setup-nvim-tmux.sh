#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

TMUX_SOURCE="${SCRIPT_DIR}/tmux/.tmux.conf"
NVIM_SOURCE="${SCRIPT_DIR}/nvim"

TMUX_TARGET="${HOME}/.tmux.conf"
NVIM_TARGET="${HOME}/.config/nvim"

BACKUP_ROOT="${HOME}/.config/dev-setup-backups"
BACKUP_DIR="${BACKUP_ROOT}/$(date +%Y%m%d%H%M%S)"
BACKUP_CREATED=0

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Error: required command '$1' is not installed." >&2
    exit 1
  fi
}

prepare_backup_dir() {
  if [[ "${BACKUP_CREATED}" -eq 0 ]]; then
    mkdir -p "${BACKUP_DIR}"
    BACKUP_CREATED=1
  fi
}

backup_existing() {
  local target="$1"

  if [[ -e "${target}" || -L "${target}" ]]; then
    prepare_backup_dir
    local name
    name="$(basename "${target}")"
    mv "${target}" "${BACKUP_DIR}/${name}"
    echo "Backed up ${target} -> ${BACKUP_DIR}/${name}"
  fi
}

link_path() {
  local source="$1"
  local target="$2"

  mkdir -p "$(dirname "${target}")"

  if [[ -L "${target}" ]]; then
    local current_link
    current_link="$(readlink "${target}")"
    if [[ "${current_link}" == "${source}" ]]; then
      echo "Already linked: ${target}"
      return
    fi
  fi

  backup_existing "${target}"
  ln -s "${source}" "${target}"
  echo "Linked ${target} -> ${source}"
}

install_tpm() {
  local tpm_dir="${HOME}/.tmux/plugins/tpm"
  if [[ -d "${tpm_dir}" ]]; then
    echo "TPM already installed at ${tpm_dir}"
    return
  fi

  require_cmd git
  mkdir -p "$(dirname "${tpm_dir}")"
  git clone https://github.com/tmux-plugins/tpm "${tpm_dir}"
  echo "Installed TPM at ${tpm_dir}"
}

main() {
  if [[ ! -f "${TMUX_SOURCE}" ]]; then
    echo "Error: tmux config source file not found at ${TMUX_SOURCE}" >&2
    exit 1
  fi

  if [[ ! -d "${NVIM_SOURCE}" ]]; then
    echo "Error: nvim config source directory not found at ${NVIM_SOURCE}" >&2
    exit 1
  fi

  link_path "${TMUX_SOURCE}" "${TMUX_TARGET}"
  link_path "${NVIM_SOURCE}" "${NVIM_TARGET}"

  install_tpm

  if [[ "${BACKUP_CREATED}" -eq 1 ]]; then
    echo "Existing configs were backed up under ${BACKUP_DIR}"
  fi

  echo "Setup complete."
  echo "Next steps:"
  echo "  1) Reload tmux: tmux source-file ~/.tmux.conf"
  echo "  2) Install tmux plugins inside tmux: prefix + I"
  echo "  3) Open nvim and run: :PackerSync"
}

main "$@"
