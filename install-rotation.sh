#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
UNIT_DIR="${HOME}/.config/systemd/user"

install -Dm755 "${ROOT_DIR}/extras/bin/cyan-tide-rotate" "${BIN_DIR}/cyan-tide-rotate"
install -Dm644 "${ROOT_DIR}/extras/systemd/cyan-tide-rotate.service" "${UNIT_DIR}/cyan-tide-rotate.service"
install -Dm644 "${ROOT_DIR}/extras/systemd/cyan-tide-rotate.timer" "${UNIT_DIR}/cyan-tide-rotate.timer"

systemctl --user daemon-reload
systemctl --user enable --now cyan-tide-rotate.timer

printf 'Installed and enabled Cyan Tide daily accent rotation.\n'
printf 'Run now: cyan-tide-rotate\n'
printf 'Check timer: systemctl --user status cyan-tide-rotate.timer\n'
