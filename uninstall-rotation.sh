#!/usr/bin/env bash
set -euo pipefail

systemctl --user disable --now cyan-tide-rotate.timer 2>/dev/null || true
rm -f "${HOME}/.config/systemd/user/cyan-tide-rotate.timer"
rm -f "${HOME}/.config/systemd/user/cyan-tide-rotate.service"
rm -f "${HOME}/.local/bin/cyan-tide-rotate"
systemctl --user daemon-reload

printf 'Removed Cyan Tide daily accent rotation. The theme itself was not removed.\n'
