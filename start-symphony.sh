#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SYMPHONY_ROOT="${SCRIPT_DIR}"
SYMPHONY_ELIXIR_ROOT="${SYMPHONY_ROOT}/elixir"
PORT="${SYMPHONY_PORT:-4321}"

if command -v direnv >/dev/null 2>&1 && [[ -f "${SYMPHONY_ROOT}/.envrc" ]]; then
  set +u
  eval "$(cd "${SYMPHONY_ROOT}" && direnv export bash 2>/dev/null)"
  set -u
fi

if [[ ! -d "${SYMPHONY_ELIXIR_ROOT}" ]]; then
  echo "Missing Symphony Elixir directory: ${SYMPHONY_ELIXIR_ROOT}" >&2
  exit 1
fi

run_in_symphony() {
  if command -v direnv >/dev/null 2>&1; then
    (cd "${SYMPHONY_ELIXIR_ROOT}" && direnv exec .. "$@")
  else
    (cd "${SYMPHONY_ELIXIR_ROOT}" && "$@")
  fi
}

echo "Starting Symphony from ${SYMPHONY_ELIXIR_ROOT}"
echo "Dashboard: http://127.0.0.1:${PORT}/"

run_in_symphony mise trust
run_in_symphony mise install
run_in_symphony mise exec -- mix build
run_in_symphony mise exec -- ./bin/symphony ./WORKFLOW.md --port "${PORT}" --i-understand-that-this-will-be-running-without-the-usual-guardrails
