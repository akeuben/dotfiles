{ pkgs ? import <nixpkgs> {} }:

pkgs.writeShellScriptBin "dolphin-emu" ''
  #!${pkgs.bash}/bin/bash

  set -euo pipefail

  DOLPHIN_BIN="${pkgs.dolphin-emu}/bin/dolphin-emu"

  PIPE=$(mktemp -u)
  mkfifo "$PIPE"

  # Launch Dolphin
  "$DOLPHIN_BIN" -C Logger.Logs.IOS=True "$@" > "$PIPE" 2>&1 &
  DOLPHIN_PID=$!

  # Read output and monitor
  while IFS= read -r line; do
      echo "$line"

      if [[ "$line" == *"Re-launching title 0000000100000002"* ]]; then
          echo "[wrapper] Detected return to Wii Menu → closing Dolphin"
          kill -TERM "$DOLPHIN_PID" 2>/dev/null || true
          break
      fi
  done < "$PIPE"

  rm -f "$PIPE"
''
