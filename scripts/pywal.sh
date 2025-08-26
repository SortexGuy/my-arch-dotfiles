#!/usr/bin/env bash

./generate-chromium-theme.sh

ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
ln -sf ~/.cache/wal/zathurarc ~/.config/zathura/zathurarc

sed -i '/background/s@#[[:xdigit:]]\{6\}@'"$color0"'@' ~/.config/mpv/mpv.conf
sed -i '/buttonHoveredColor/s@#[[:xdigit:]]\{6\}@'"$color11"'@ ; /seekbarFgColor/s@#[[:xdigit:]]\{6\}@'"$color2"'@' ~/.config/mpv/script-opts/tethys.conf

# Gtk stuff
cp -f "${HOME}/.cache/wal/pywal.json" "${HOME}/.config/presets/user/pywal.json"
mkdir -p "${HOME}/.config/Kvantum/pywal"
cp "${HOME}/.cache/wal/pywal.kvconfig" "${HOME}/.config/Kvantum/pywal/pywal.kvconfig"
cp "${HOME}/.cache/wal/pywal.svg" "${HOME}/.config/Kvantum/pywal/pywal.svg"

