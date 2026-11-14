#!/usr/bin/env bash
# Set up Zed on this Mac with my config from this repo.
#   ./install.sh          symlink settings + keymap; install fonts
# Safe to re-run. Existing files/links are backed up first.
set -euo pipefail

REPO="$(cd "$(dirname "$0")" && pwd)"
ZED="$HOME/.config/zed"
STAMP="$(date +%Y%m%d-%H%M%S)"

link() { # link <repo file> <target path>
  local src="$REPO/$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "ok      $dst"
    return
  fi
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mv "$dst" "$dst.backup-$STAMP"
    echo "backup  $dst -> $dst.backup-$STAMP"
  fi
  ln -s "$src" "$dst"
  echo "linked  $dst -> $src"
}

link config/settings.json "$ZED/settings.json"
link config/keymap.json "$ZED/keymap.json"

# JetBrains Mono with italics (Driftwood uses italic keywords/properties).
if ls "$HOME/Library/Fonts"/JetBrainsMono-Italic.ttf >/dev/null 2>&1 \
  || ls /Library/Fonts/JetBrainsMono-Italic.ttf >/dev/null 2>&1; then
  echo "ok      JetBrains Mono (with italics)"
elif command -v brew >/dev/null 2>&1; then
  brew install --cask font-jetbrains-mono
else
  echo "MISSING JetBrains Mono italics: install from https://www.jetbrains.com/lp/mono/" >&2
fi

echo
echo "Done. Restart Zed. Themes/icons come from the Archipelago extension"
echo "(store, or dev install of the archipelago repo); php, blade and scss"
echo "extensions install automatically on first launch."
