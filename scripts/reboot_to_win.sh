#!/usr/bin/env bash
set -e

ENTRY="windows.conf"

# проверка что entry существует
if [ ! -f "/boot/loader/entries/$ENTRY" ]; then
  echo "Windows boot entry not found: $ENTRY"
  exit 1
fi

# elevate (через polkit/sudo — что есть)
if ! sudo -n true 2>/dev/null; then
  echo "Authentication required..."
  sudo true
fi

# one-shot boot
sudo bootctl set-oneshot "$ENTRY"

# reboot
sudo systemctl reboot