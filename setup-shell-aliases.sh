#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ALIASES_SOURCE="${SCRIPT_DIR}/shell/aliases.sh"
ALIASES_TARGET="${HOME}/.config/dev-setup/shell/aliases.sh"

BLOCK_START="# >>> my-dev-setup aliases >>>"
BLOCK_END="# <<< my-dev-setup aliases <<<"

backup_and_link_aliases() {
  mkdir -p "$(dirname "${ALIASES_TARGET}")"

  if [[ -L "${ALIASES_TARGET}" ]]; then
    local current_link
    current_link="$(readlink "${ALIASES_TARGET}")"
    if [[ "${current_link}" == "${ALIASES_SOURCE}" ]]; then
      echo "Aliases file already linked at ${ALIASES_TARGET}"
      return
    fi
  fi

  if [[ -e "${ALIASES_TARGET}" || -L "${ALIASES_TARGET}" ]]; then
    local backup_path="${ALIASES_TARGET}.bak.$(date +%Y%m%d%H%M%S)"
    mv "${ALIASES_TARGET}" "${backup_path}"
    echo "Backed up ${ALIASES_TARGET} -> ${backup_path}"
  fi

  ln -s "${ALIASES_SOURCE}" "${ALIASES_TARGET}"
  echo "Linked ${ALIASES_TARGET} -> ${ALIASES_SOURCE}"
}

ensure_source_block() {
  local rc_file="$1"
  touch "${rc_file}"

  if grep -Fq "${BLOCK_START}" "${rc_file}"; then
    echo "Aliases source block already exists in ${rc_file}"
    return
  fi

  {
    echo ""
    echo "${BLOCK_START}"
    echo "if [ -f \"${ALIASES_TARGET}\" ]; then"
    echo "  . \"${ALIASES_TARGET}\""
    echo "fi"
    echo "${BLOCK_END}"
  } >> "${rc_file}"

  echo "Added aliases source block to ${rc_file}"
}

main() {
  if [[ ! -f "${ALIASES_SOURCE}" ]]; then
    echo "Error: aliases source file not found at ${ALIASES_SOURCE}" >&2
    exit 1
  fi

  backup_and_link_aliases
  ensure_source_block "${HOME}/.zshrc"
  ensure_source_block "${HOME}/.bashrc"

  echo "Alias setup complete."
  echo "Run one of these to use aliases now:"
  echo "  source ~/.zshrc"
  echo "  source ~/.bashrc"
}

main "$@"
